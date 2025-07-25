/*
  Warnings:

  - You are about to drop the column `insurance` on the `Practitioner` table. All the data in the column will be lost.
  - You are about to drop the column `medicaid` on the `Practitioner` table. All the data in the column will be lost.
  - You are about to drop the column `medicare` on the `Practitioner` table. All the data in the column will be lost.
  - You are about to drop the column `npi` on the `Practitioner` table. All the data in the column will be lost.
  - You are about to drop the column `tricare` on the `Practitioner` table. All the data in the column will be lost.
  - You are about to drop the column `workersComp` on the `Practitioner` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "Practitioner_npi_key";

-- AlterTable
ALTER TABLE "Practitioner" DROP COLUMN "insurance",
DROP COLUMN "medicaid",
DROP COLUMN "medicare",
DROP COLUMN "npi",
DROP COLUMN "tricare",
DROP COLUMN "workersComp",
ADD COLUMN     "latitude" DOUBLE PRECISION,
ADD COLUMN     "longitude" DOUBLE PRECISION;

-- DropEnum
DROP TYPE "INSURANCE";

-- CreateTable
CREATE TABLE "Degree" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "fullName" TEXT,
    "description" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Degree_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Insurance" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT,
    "website" TEXT,
    "phone" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Insurance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PractitionerDegree" (
    "id" TEXT NOT NULL,
    "practitionerId" TEXT NOT NULL,
    "degreeId" TEXT NOT NULL,
    "yearObtained" INTEGER,
    "institution" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PractitionerDegree_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PractitionerInsurance" (
    "id" TEXT NOT NULL,
    "practitionerId" TEXT NOT NULL,
    "insuranceId" TEXT NOT NULL,
    "isPreferred" BOOLEAN DEFAULT false,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PractitionerInsurance_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Degree_name_key" ON "Degree"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Insurance_name_key" ON "Insurance"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Insurance_code_key" ON "Insurance"("code");

-- CreateIndex
CREATE UNIQUE INDEX "PractitionerDegree_practitionerId_degreeId_key" ON "PractitionerDegree"("practitionerId", "degreeId");

-- CreateIndex
CREATE UNIQUE INDEX "PractitionerInsurance_practitionerId_insuranceId_key" ON "PractitionerInsurance"("practitionerId", "insuranceId");

-- AddForeignKey
ALTER TABLE "PractitionerDegree" ADD CONSTRAINT "PractitionerDegree_practitionerId_fkey" FOREIGN KEY ("practitionerId") REFERENCES "Practitioner"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PractitionerDegree" ADD CONSTRAINT "PractitionerDegree_degreeId_fkey" FOREIGN KEY ("degreeId") REFERENCES "Degree"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PractitionerInsurance" ADD CONSTRAINT "PractitionerInsurance_practitionerId_fkey" FOREIGN KEY ("practitionerId") REFERENCES "Practitioner"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PractitionerInsurance" ADD CONSTRAINT "PractitionerInsurance_insuranceId_fkey" FOREIGN KEY ("insuranceId") REFERENCES "Insurance"("id") ON DELETE CASCADE ON UPDATE CASCADE;
