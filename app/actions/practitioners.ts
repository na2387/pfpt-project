"use server";

import { prisma } from "@/lib/prisma";
import { Practitioner } from "@/generated/prisma";

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
};

export interface SearchFilters {
  name?: string;
  borough?: string;
  state?: string;
  zip?: string;
  insurance?: string[];
  degrees?: string[];
}

export async function getPractitioners(
  filters: SearchFilters = {},
  page = 1,
  pageSize = 10
) {
  const skip = (page - 1) * pageSize;

  const where: any = {};

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

  // Insurance filters - now using the correct junction table relation name
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

  // Degrees filter - now using the correct junction table relation name
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

  const [practitioners, total] = await Promise.all([
    prisma.practitioner.findMany({
      where,
      skip,
      take: pageSize,
      include: {
        degrees: {
          include: {
            degree: true,
          },
        },
        insurances: {
          include: {
            insurance: true,
          },
        },
      },
      orderBy: [{ lastName: "asc" }, { firstName: "asc" }],
    }),
    prisma.practitioner.count({ where }),
  ]);

  return {
    practitioners,
    total,
    totalPages: Math.ceil(total / pageSize),
  };
}

// Helper function to get all available insurances for the dropdown
export async function getAvailableInsurances() {
  const insurances = await prisma.insurance.findMany({
    orderBy: { name: "asc" },
    select: {
      id: true,
      name: true,
      _count: {
        select: {
          practitioners: true,
        },
      },
    },
  });

  return insurances.filter((insurance) => insurance._count.practitioners > 0);
}

// Helper function to get all available degrees for filtering
export async function getAvailableDegrees() {
  const degrees = await prisma.degree.findMany({
    orderBy: { name: "asc" },
    select: {
      id: true,
      name: true,
      _count: {
        select: {
          practitioners: true,
        },
      },
    },
  });

  return degrees.filter((degree) => degree._count.practitioners > 0);
}
