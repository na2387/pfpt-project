import { PrismaClient } from "@/generated/prisma";
import * as fs from "fs";

const prisma = new PrismaClient();

async function exportInsuranceNames() {
  const insurances = await prisma.insurance.findMany({
    select: {
      name: true,
    },
    orderBy: {
      name: "asc",
    },
  });

  // Export as simple text list
  const names = insurances.map((ins) => ins.name).join("\n");
  fs.writeFileSync("insurance-names.txt", names);

  console.log(
    `Exported ${insurances.length} insurance names to insurance-names.txt`
  );

  // Also log to console so you can copy-paste
  console.log("\n--- Insurance Names ---");
  insurances.forEach((ins) => console.log(ins.name));
}

exportInsuranceNames()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
