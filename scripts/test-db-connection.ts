const { PrismaClient } = require("../generated/prisma");

async function testConnection() {
  const prisma = new PrismaClient({
    log: ["query", "error", "warn"],
  });

  try {
    console.log("Testing database connection...");
    console.log("DATABASE_URL exists:", !!process.env.DATABASE_URL);
    console.log(
      "DATABASE_URL preview:",
      process.env.DATABASE_URL?.substring(0, 30) + "..."
    );

    // Test basic connection
    await prisma.$connect();
    console.log("✅ Connection successful");

    // Test simple query
    const result = await prisma.$queryRaw`SELECT NOW() as current_time`;
    console.log("✅ Query test successful:", result);

    // Count practitioners
    const count = await prisma.practitioner.count();
    console.log("✅ Practitioner count:", count);

    // Sample practitioner
    const sample = await prisma.practitioner.findFirst();
    console.log("✅ Sample practitioner:", sample?.firstName, sample?.lastName);
  } catch (error) {
    console.error("❌ Database test failed:", error);
  } finally {
    await prisma.$disconnect();
  }
}

testConnection();
