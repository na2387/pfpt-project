import { PrismaClient } from "../generated/prisma";

export const prisma =
  globalThis.prisma ?? new PrismaClient({ log: ["error", "warn"] });

if (process.env.NODE_ENV !== "production") globalThis.prisma = prisma as any;
