/*
  Warnings:

  - You are about to drop the column `certs` on the `Practitioner` table. All the data in the column will be lost.
  - You are about to drop the column `city` on the `Practitioner` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `Practitioner` table. All the data in the column will be lost.
  - You are about to drop the column `latitude` on the `Practitioner` table. All the data in the column will be lost.
  - You are about to drop the column `longitude` on the `Practitioner` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "Practitioner_email_key";

-- AlterTable
ALTER TABLE "Practitioner" DROP COLUMN "certs",
DROP COLUMN "city",
DROP COLUMN "email",
DROP COLUMN "latitude",
DROP COLUMN "longitude",
ADD COLUMN     "borough" TEXT,
ADD COLUMN     "cert" TEXT,
ADD COLUMN     "lat" DOUBLE PRECISION,
ADD COLUMN     "long" DOUBLE PRECISION,
ADD COLUMN     "practice" TEXT,
ALTER COLUMN "address" DROP NOT NULL;
