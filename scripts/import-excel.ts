import { PrismaClient } from "@/generated/prisma";
import * as XLSX from "xlsx";
import * as fs from "fs";

const prisma = new PrismaClient();

interface ExcelRow {
  firstName?: string;
  lastName: string;
  degrees: string; // comma-separated
  phone?: string;
  address?: string;
  borough?: string;
  practice?: string;
  long?: number;
  lat?: number;
  zip?: string;
  state?: string;
  website?: string;
  insurance: string; // comma-separated
  selfPayInitial?: number;
  selfPayFollowUp?: number;
  cert?: string;
  notes?: string;
}

// Move the normalization mapping outside the function for better performance
const insuranceNormalization: Record<string, string | undefined> = {
  // Handle fragments and consolidate
  "-": undefined,
  "*Healthfirst is going out of network on August 1": undefined,
  "2025": undefined,
  "3 & 4": undefined,
  "3 and 4": undefined,
  "and MLTSS": undefined,
  Commercial: undefined,
  "Commercial (Cancer/CHD/Nontransplant)": undefined,
  "Commercial (Transplant)": undefined,
  "Commercial; Medicaid; Medicare": undefined,
  "Inc.": undefined,
  Plus: undefined,
  PPO: undefined,
  HMO: undefined,
  EPO: undefined,
  POS: undefined,
  "Basic Health Plan": undefined,
  "Child Health Plus": undefined,
  CHP: undefined,
  "Essential Plan": undefined,
  "Essential Plan 1 and 2": undefined,
  "Essential Plan 3 and 4": undefined,
  "Essential Plans": undefined,
  Exchange: undefined,
  "Medicare Advantage Plans": undefined,
  "Qualified Health Plans": undefined,
  "Dual Advantage Plans": undefined,
  "on Long Island and select NYC locations. Please check with your office directly to confirm if Healthfirst is accepted.":
    undefined,

  // Major insurances - normalize variations
  "1199": "1199",
  "1199 National Benefit Fund": "1199",
  "Local 1199": "1199",

  // Aetna variations
  Aetna: "Aetna",
  "Aetna PPO": "Aetna",
  "Aetna USHC": "Aetna",
  "UMR - Aetna": "Aetna",
  "Meritain Health": "Aetna",

  // Cigna variations
  Cigna: "Cigna",
  CIgna: "Cigna",
  "Cigna PPO": "Cigna",
  "Cigna HMO": "Cigna",

  // Blue Cross Blue Shield variations
  "Blue Cross Blue Shield": "Blue Cross Blue Shield",
  BCBS: "Blue Cross Blue Shield",
  "Blue Cross / Blue Shield PPO": "Blue Cross Blue Shield",
  Anthem: "Blue Cross Blue Shield",
  "Anthem BCBS": "Blue Cross Blue Shield",
  "Empire BCBS": "Blue Cross Blue Shield",

  // United Healthcare variations
  "United Healthcare": "United Healthcare",
  UHC: "United Healthcare",
  "United Healthcare PPO": "United Healthcare",
  "United Health Care/MPN": "United Healthcare",

  // Oxford variations
  Oxford: "Oxford",
  "Oxford Health Plans": "Oxford",
  "Oxford Health": "Oxford",
  "UHC Oxford": "Oxford",

  // EmblemHealth variations
  EmblemHealth: "EmblemHealth",
  Emblem: "EmblemHealth",
  GHI: "EmblemHealth",
  HIP: "EmblemHealth",
  "Emblem Health GHI": "EmblemHealth",
  "Emblem Health HIP": "EmblemHealth",

  // Other major insurances
  Fidelis: "Fidelis",
  FIdelis: "Fidelis",
  "Fidelis Care": "Fidelis",
  Healthfirst: "Healthfirst",
  "Health First": "Healthfirst",
  Medicare: "Medicare",
  Medicaid: "Medicaid",
  Horizon: "Horizon",
  HORIZON: "Horizon",
  Magnacare: "Magnacare",
  MagnaCare: "Magnacare",
  Multiplan: "Multiplan",
  Humana: "Humana",
  MVP: "MVP",
  "VNS Choice": "VNS Choice",
  VNS: "VNS Choice",
  "VNSNY Choice": "VNS Choice",
  Wellcare: "Wellcare",
  WellCare: "Wellcare",
  Tricare: "Tricare",
  "Workers' Compensation": "Workers' Compensation",
  "Workers comp": "Workers' Compensation",
  "Workers Compensation": "Workers' Compensation",
  "Workers' Comp": "Workers' Compensation",
  Oscar: "Oscar",
  "Partners Health Plan": "Partners Health Plan",
  "Partners Health Direct": "Partners Health Plan",
  "No Fault": "No Fault",
  "Amida Care": "Amida Care",
  ElderPlan: "ElderPlan",
  Elderplan: "ElderPlan",
  MetroPlus: "MetroPlus",
  Metroplus: "MetroPlus",
  ConnectiCare: "ConnectiCare",
  Connecticare: "ConnectiCare",
  "Affinity by Molina Healthcare": "Affinity by Molina Healthcare",
  "Age Well": "Age Well",
  "Centerlight Healthcare": "Centerlight Healthcare",
  "Centers Plan for Healthy Living": "Centers Plan for Healthy Living",
  Centivo: "Centivo",
  "Village Care": "Village Care",
  "Empire Plan": "Empire Plan",
  AmeriHealth: "AmeriHealth",
  "Clover Health": "Clover Health",
  Ace: "Ace",
  Corvel: "Corvel",
  Highmark: "Highmark",
  Independence: "Independence",
  "Keystone First": "Keystone First",
  QualCare: "QualCare",
  Hamaspik: "Hamaspik",
  "Lifestyle Health Plans": "Lifestyle Health Plans",
  "Senior Whole Health": "Senior Whole Health",
  UMR: "UMR",
  "Neighborhood Health": "Neighborhood Health",
  "NY Community Health Plan": "NY Community Health Plan",
  "NY Presbyterian": "NY Presbyterian",
  PHCS: "PHCS",
  "School Insurance": "School Insurance",
  "Health Net": "Health Net",
  "Vytra Healthcare": "Vytra Healthcare",
  "First Health Network": "First Health Network",
  "Great West Healthcare": "Great West Healthcare",
  "Northwell Direct Network": "Northwell Direct Network",
  Pacificare: "Pacificare",
  "Quality Health Management": "Quality Health Management",
  "Tufts Health Plan": "Tufts Health Plan",
  Unicare: "Unicare",
  "Beech Street": "Beech Street",
  "Consumer Health Network": "Consumer Health Network",
  "Devon Health Services": "Devon Health Services",
  Equian: "Equian",
  "Health Alliance Plan": "Health Alliance Plan",
  "Health Partners": "Health Partners",
  POMCO: "POMCO",
  "Sedgwick WTC": "Sedgwick WTC",
  "VA Community Care Network": "VA Community Care Network",
  "World Trade Center Health Program": "World Trade Center Health Program",
  Worldwide: "Worldwide",
};

function normalizeInsuranceName(name: string): string | undefined {
  const trimmed = name.trim();

  // Handle special characters and line breaks
  const cleaned = trimmed
    .replace(/\r\n/g, "")
    .replace(/\n/g, "")
    .replace(/\r/g, "")
    .replace(/\s+/g, " ")
    .trim();

  // Return undefined for fragments/noise we want to skip
  const result = insuranceNormalization[cleaned];
  if (result === undefined) return undefined;

  return result || cleaned;
}

// Extract known insurance companies using pattern matching
function extractInsuranceCompanies(insuranceText: string): string[] {
  const majorInsurers = [
    "Aetna",
    "Cigna",
    "United Healthcare",
    "UHC",
    "Blue Cross Blue Shield",
    "BCBS",
    "Oxford",
    "EmblemHealth",
    "Fidelis",
    "Healthfirst",
    "Medicare",
    "Medicaid",
    "Horizon",
    "Magnacare",
    "Multiplan",
    "Humana",
    "MVP",
    "VNS Choice",
    "Wellcare",
    "Tricare",
    "Oscar",
    "Partners Health Plan",
    "Amida Care",
    "ElderPlan",
    "MetroPlus",
    "ConnectiCare",
    "Affinity by Molina Healthcare",
    "Age Well",
    "Centerlight Healthcare",
    "Centers Plan for Healthy Living",
    "Centivo",
    "Village Care",
    "Empire Plan",
    "1199",
    "AmeriHealth",
    "Clover Health",
    "Workers' Compensation",
    "Workers Comp",
    "No Fault",
  ];

  const found: string[] = [];
  const lowerText = insuranceText.toLowerCase();

  for (const insurer of majorInsurers) {
    if (lowerText.includes(insurer.toLowerCase())) {
      // Normalize the name
      let normalized = insurer;
      if (insurer === "UHC") normalized = "United Healthcare";
      if (insurer === "BCBS") normalized = "Blue Cross Blue Shield";
      if (insurer === "Workers Comp") normalized = "Workers' Compensation";

      if (!found.includes(normalized)) {
        found.push(normalized);
      }
    }
  }

  return found;
}

async function importExcelData(filePath: string) {
  console.log("Reading Excel file...");
  const workbook = XLSX.readFile(filePath);
  const sheetName = workbook.SheetNames[0];
  const worksheet = workbook.Sheets[sheetName];
  const jsonData: ExcelRow[] = XLSX.utils.sheet_to_json(worksheet);

  console.log(`Found ${jsonData.length} practitioners to import`);

  for (let i = 0; i < jsonData.length; i++) {
    const row = jsonData[i];
    console.log(
      `Processing practitioner ${i + 1}/${jsonData.length}: ${row.firstName} ${
        row.lastName
      }`
    );

    try {
      // Handle missing firstName
      if (!row.firstName) {
        console.log(`Skipping row ${i + 1}: Missing firstName`);
        continue;
      }

      // Create the practitioner
      const practitioner = await prisma.practitioner.create({
        data: {
          firstName: row.firstName,
          lastName: row.lastName,
          cert: row.cert || null,
          phone: row.phone || null,
          address: row.address || "Unknown",
          borough: row.borough || null,
          state: row.state || null,
          long: row.long || null,
          lat: row.lat || null,
          zip: row.zip ? row.zip.toString() : null,
          website: row.website || null,
          selfPayInitial: row.selfPayInitial || 0,
          selfPayFollowUp: row.selfPayFollowUp || 0,
        },
      });

      console.log(
        `Created practitioner: ${practitioner.firstName} ${practitioner.lastName}`
      );

      // Process degrees (comma-separated)
      if (row.degrees && row.degrees.trim()) {
        const degreeNames = row.degrees
          .split(",")
          .map((d) => d.trim())
          .filter((d) => d);

        for (const degreeName of degreeNames) {
          // Find or create the degree
          let degree = await prisma.degree.findUnique({
            where: { name: degreeName },
          });

          if (!degree) {
            degree = await prisma.degree.create({
              data: { name: degreeName },
            });
            console.log(`Created new degree: ${degreeName}`);
          }

          // Check if relationship already exists
          const existingRelation = await prisma.practitionerDegree.findUnique({
            where: {
              practitionerId_degreeId: {
                practitionerId: practitioner.id,
                degreeId: degree.id,
              },
            },
          });

          if (!existingRelation) {
            // Link practitioner to degree
            await prisma.practitionerDegree.create({
              data: {
                practitionerId: practitioner.id,
                degreeId: degree.id,
              },
            });
            console.log(
              `Linked ${practitioner.firstName} ${practitioner.lastName} to degree: ${degreeName}`
            );
          }
        }
      }

      // Process insurance
      if (row.insurance && row.insurance.trim()) {
        // First try the extraction approach
        let insuranceNames = extractInsuranceCompanies(row.insurance);

        // If extraction didn't find anything, fall back to splitting and normalizing
        if (insuranceNames.length === 0) {
          insuranceNames = row.insurance
            .replace(/[\r\n]+/g, ",")
            .split(",")
            .map((i) => normalizeInsuranceName(i.trim()))
            .filter((i): i is string => i !== undefined && i.length > 0)
            .filter((value, index, self) => self.indexOf(value) === index);
        }

        // Remove duplicates
        insuranceNames = [...new Set(insuranceNames)];

        for (const insuranceName of insuranceNames) {
          // Find or create the insurance
          let insurance = await prisma.insurance.findUnique({
            where: { name: insuranceName },
          });

          if (!insurance) {
            insurance = await prisma.insurance.create({
              data: { name: insuranceName },
            });
            console.log(`Created new insurance: ${insuranceName}`);
          }

          // Check if relationship already exists
          const existingRelation =
            await prisma.practitionerInsurance.findUnique({
              where: {
                practitionerId_insuranceId: {
                  practitionerId: practitioner.id,
                  insuranceId: insurance.id,
                },
              },
            });

          if (!existingRelation) {
            // Link practitioner to insurance
            await prisma.practitionerInsurance.create({
              data: {
                practitionerId: practitioner.id,
                insuranceId: insurance.id,
              },
            });
            console.log(
              `Linked ${practitioner.firstName} ${practitioner.lastName} to insurance: ${insuranceName}`
            );
          }
        }
      }
    } catch (error) {
      console.error(`Error processing row ${i + 1}:`, error);
      console.error("Row data:", row);
      // Continue with next row instead of stopping
    }
  }

  console.log("Import completed!");
}

// Run the import
async function main() {
  const filePath = process.argv[2];
  if (!filePath) {
    console.error("Please provide the Excel file path as an argument");
    console.error(
      "Usage: npx tsx scripts/import-excel.ts /path/to/your/file.xlsx"
    );
    process.exit(1);
  }

  if (!fs.existsSync(filePath)) {
    console.error(`File not found: ${filePath}`);
    process.exit(1);
  }

  await importExcelData(filePath);
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
