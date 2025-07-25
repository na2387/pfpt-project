-- CreateEnum
CREATE TYPE "INSURANCE" AS ENUM ('AETNA', 'BCBS', 'CIGNA', 'OXFORD', 'UHC', 'HORIZON', 'HEALTH_NET', 'MEDICARE');

-- CreateTable
CREATE TABLE "Practitioner" (
    "id" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "certs" TEXT,
    "email" TEXT,
    "phone" TEXT,
    "npi" TEXT,
    "address" TEXT NOT NULL,
    "city" TEXT,
    "state" TEXT,
    "zip" TEXT,
    "website" TEXT,
    "medicare" BOOLEAN DEFAULT false,
    "medicaid" BOOLEAN DEFAULT false,
    "tricare" BOOLEAN DEFAULT false,
    "workersComp" BOOLEAN DEFAULT false,
    "selfPayInitial" INTEGER DEFAULT 0,
    "selfPayFollowUp" INTEGER DEFAULT 0,
    "insurance" "INSURANCE"[],
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Practitioner_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Practitioner_email_key" ON "Practitioner"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Practitioner_npi_key" ON "Practitioner"("npi");
