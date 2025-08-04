"use server";

import { prisma } from "@/lib/prisma";
import { Practitioner, Prisma } from "@/generated/prisma";
import { unstable_cache } from "next/cache";

export type PractitionerWithRelations = Practitioner & {
  degrees: {
    degree: {
      id: string;
      name: string;
    };
  }[];
  insurances: {
    insurance: {
      id: string;
      name: string;
    };
  }[];
  _count: {
    insurances: number;
  };
};

export interface SearchFilters {
  name?: string;
  borough?: string;
  state?: string;
  zip?: string;
  insurance?: string[];
  degrees?: string[];
}

export type SortField = "name" | "insurance_count" | "self_pay";
export type SortDirection = "asc" | "desc";

export interface SortOptions {
  field: SortField;
  direction: SortDirection;
}

// REPLACE the old functions with these cached versions
const getCachedInsurances = unstable_cache(
  async () => {
    return await prisma.insurance.findMany({
      where: {
        practitioners: {
          some: {}, // Only include insurances that have practitioners
        },
      },
      select: {
        id: true,
        name: true,
        _count: {
          select: {
            practitioners: true,
          },
        },
      },
      orderBy: { name: "asc" },
    });
  },
  ["available-insurances"],
  {
    revalidate: 5 * 60, // 5 minutes
    tags: ["insurances"],
  }
);

const getCachedDegrees = unstable_cache(
  async () => {
    return await prisma.degree.findMany({
      where: {
        practitioners: {
          some: {}, // Only include degrees that have practitioners
        },
      },
      select: {
        id: true,
        name: true,
        _count: {
          select: {
            practitioners: true,
          },
        },
      },
      orderBy: { name: "asc" },
    });
  },
  ["available-degrees"],
  {
    revalidate: 5 * 60, // 5 minutes
    tags: ["degrees"],
  }
);

// REPLACE the old functions completely
export async function getAvailableInsurances() {
  return getCachedInsurances();
}

export async function getAvailableDegrees() {
  return getCachedDegrees();
}

// Your existing getPractitioners function remains the same
export async function getPractitioners(
  filters: SearchFilters = {},
  page = 1,
  pageSize = 10,
  sort: SortOptions = { field: "name", direction: "asc" }
) {
  const skip = (page - 1) * pageSize;

  const where: Prisma.PractitionerWhereInput = {};

  // Name search (firstName or lastName)
  if (filters.name) {
    where.OR = [
      { firstName: { contains: filters.name, mode: "insensitive" } },
      { lastName: { contains: filters.name, mode: "insensitive" } },
    ];
  }

  // Location filters
  if (filters.borough) {
    where.borough = { contains: filters.borough, mode: "insensitive" };
  }
  if (filters.state) {
    where.state = { contains: filters.state, mode: "insensitive" };
  }
  if (filters.zip) {
    where.zip = { contains: filters.zip };
  }

  // Insurance filters
  if (filters.insurance && filters.insurance.length > 0) {
    where.insurances = {
      some: {
        insurance: {
          name: {
            in: filters.insurance,
          },
        },
      },
    };
  }

  // Degrees filter
  if (filters.degrees && filters.degrees.length > 0) {
    where.degrees = {
      some: {
        degree: {
          name: {
            in: filters.degrees,
          },
        },
      },
    };
  }

  // Build orderBy based on sort options
  let orderBy: Prisma.PractitionerOrderByWithRelationInput[] = [];

  switch (sort.field) {
    case "name":
      orderBy = [{ lastName: sort.direction }, { firstName: sort.direction }];
      break;
    case "insurance_count":
      orderBy = [{ insurances: { _count: sort.direction } }];
      break;
    case "self_pay":
      orderBy = [
        { selfPayInitial: sort.direction },
        { selfPayFollowUp: sort.direction },
      ];
      break;
    default:
      orderBy = [{ lastName: "asc" }, { firstName: "asc" }];
  }

  const result = await prisma.$transaction(async (tx) => {
    const [practitioners, total] = await Promise.all([
      tx.practitioner.findMany({
        where,
        skip,
        take: pageSize,
        select: {
          id: true,
          firstName: true,
          lastName: true,
          phone: true,
          address: true,
          borough: true,
          state: true,
          zip: true,
          website: true,
          cert: true,
          selfPayInitial: true,
          selfPayFollowUp: true,
          degrees: {
            select: {
              degree: {
                select: {
                  id: true,
                  name: true,
                },
              },
            },
          },
          insurances: {
            select: {
              insurance: {
                select: {
                  id: true,
                  name: true,
                },
              },
            },
          },
          _count: {
            select: {
              insurances: true,
            },
          },
        },
        orderBy,
      }),
      tx.practitioner.count({ where }),
    ]);

    return { practitioners, total };
  });

  return {
    practitioners: result.practitioners,
    total: result.total,
    totalPages: Math.ceil(result.total / pageSize),
  };
}
