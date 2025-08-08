import { NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";

export async function GET() {
  try {
    console.log("Debug: Testing database connection...");

    // Test database connection
    const result = await prisma.$queryRaw`SELECT NOW() as current_time`;
    console.log("Debug: Basic query successful");

    // Count practitioners
    const practitionerCount = await prisma.practitioner.count();
    console.log("Debug: Practitioner count:", practitionerCount);

    return NextResponse.json({
      status: "success",
      database: "connected",
      practitionerCount,
      currentTime: result,
      env: {
        NODE_ENV: process.env.NODE_ENV,
        DATABASE_URL_EXISTS: !!process.env.DATABASE_URL,
        DATABASE_URL_PREFIX: process.env.DATABASE_URL?.substring(0, 30) + "...",
      },
    });
  } catch (error) {
    console.error("Debug endpoint error:", error);
    return NextResponse.json(
      {
        status: "error",
        error: error instanceof Error ? error.message : "Unknown error",
        stack: error instanceof Error ? error.stack : undefined,
        env: {
          NODE_ENV: process.env.NODE_ENV,
          DATABASE_URL_EXISTS: !!process.env.DATABASE_URL,
          DATABASE_URL_PREFIX:
            process.env.DATABASE_URL?.substring(0, 30) + "...",
        },
      },
      { status: 500 }
    );
  }
}
