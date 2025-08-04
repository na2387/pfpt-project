import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";
import { Providers } from "./providers";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "Physical Therapy Provider Directory",
  description: "Find pelvic floor physical therapists near you",
  keywords: [
    "healthcare",
    "providers",
    "physical therapy",
    "pelvic floor",
    "insurance",
    "medical",
  ],
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body
        className={`${geistSans.variable} ${geistMono.variable} antialiased`}
      >
        <Providers>{children}</Providers>
        <footer className="bg-muted py-4">
          <div className="container mx-auto text-center">
            <p className="text-sm text-muted-foreground">
              &copy; {new Date().getFullYear()} PFPT Project. All rights
              reserved.
            </p>
          </div>
        </footer>
      </body>
    </html>
  );
}
