"use server";

import { prisma } from "@/lib/prisma";
import { Practitioner, INSURANCE } from "@/generated/prisma";

export type PractitionerWithFilters = Practitioner & {
  _count?: {
    insurance: number;
  };
};

export interface SearchFilters {
  name?: string;
  city?: string;
  state?: string;
  zip?: string;
  insurance?: INSURANCE[];
  medicare?: boolean;
  medicaid?: boolean;
  tricare?: boolean;
  workersComp?: boolean;
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
  if (filters.city) {
    where.city = { contains: filters.city, mode: "insensitive" };
  }
  if (filters.state) {
    where.state = { contains: filters.state, mode: "insensitive" };
  }
  if (filters.zip) {
    where.zip = { contains: filters.zip };
  }

  // Insurance filters
  if (filters.insurance && filters.insurance.length > 0) {
    where.insurance = { hasSome: filters.insurance };
  }

  // Boolean filters
  if (filters.medicare !== undefined) {
    where.medicare = filters.medicare;
  }
  if (filters.medicaid !== undefined) {
    where.medicaid = filters.medicaid;
  }
  if (filters.tricare !== undefined) {
    where.tricare = filters.tricare;
  }
  if (filters.workersComp !== undefined) {
    where.workersComp = filters.workersComp;
  }

  const [practitioners, total] = await Promise.all([
    prisma.practitioner.findMany({
      where,
      skip,
      take: pageSize,
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
