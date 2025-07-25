"use client";

import { useState } from "react";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Phone, Mail, Globe, MapPin } from "lucide-react";
import { Practitioner } from "@/generated/prisma";

interface ProvidersDataTableProps {
  practitioners: Practitioner[];
  total: number;
  currentPage: number;
  totalPages: number;
  onPageChange: (page: number) => void;
  isLoading?: boolean;
}

export function ProvidersDataTable({
  practitioners,
  total,
  currentPage,
  totalPages,
  onPageChange,
  isLoading,
}: ProvidersDataTableProps) {
  const formatInsurance = (insurance: string[]) => {
    return insurance.map((ins) => ins.replace("_", " ")).join(", ");
  };

  const formatAddress = (practitioner: Practitioner) => {
    const parts = [
      practitioner.address,
      practitioner.city,
      practitioner.state,
      practitioner.zip,
    ].filter(Boolean);
    return parts.join(", ");
  };

  if (isLoading) {
    return (
      <Card>
        <CardContent className="p-6">
          <div className="flex items-center justify-center h-32">
            <div className="text-muted-foreground">Loading providers...</div>
          </div>
        </CardContent>
      </Card>
    );
  }

  if (practitioners.length === 0) {
    return (
      <Card>
        <CardContent className="p-6">
          <div className="flex items-center justify-center h-32">
            <div className="text-muted-foreground">
              No providers found matching your criteria.
            </div>
          </div>
        </CardContent>
      </Card>
    );
  }

  return (
    <Card>
      <CardHeader>
        <CardTitle>Healthcare Providers</CardTitle>
        <CardDescription>
          Found {total} provider{total !== 1 ? "s" : ""}
        </CardDescription>
      </CardHeader>
      <CardContent>
        <div className="rounded-md border">
          <Table>
            <TableHeader>
              <TableRow>
                <TableHead>Provider</TableHead>
                <TableHead>Contact</TableHead>
                <TableHead>Location</TableHead>
                <TableHead>Insurance</TableHead>
                <TableHead>Self-Pay Rates</TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {practitioners.map((practitioner) => (
                <TableRow key={practitioner.id}>
                  <TableCell>
                    <div>
                      <div className="font-medium">
                        {practitioner.firstName} {practitioner.lastName}
                      </div>
                      {practitioner.certs && (
                        <div className="text-sm text-muted-foreground">
                          {practitioner.certs}
                        </div>
                      )}
                      {practitioner.npi && (
                        <div className="text-xs text-muted-foreground">
                          NPI: {practitioner.npi}
                        </div>
                      )}
                    </div>
                  </TableCell>
                  <TableCell>
                    <div className="space-y-1">
                      {practitioner.phone && (
                        <div className="flex items-center text-sm">
                          <Phone className="w-3 h-3 mr-1" />
                          {practitioner.phone}
                        </div>
                      )}
                      {practitioner.email && (
                        <div className="flex items-center text-sm">
                          <Mail className="w-3 h-3 mr-1" />
                          {practitioner.email}
                        </div>
                      )}
                      {practitioner.website && (
                        <div className="flex items-center text-sm">
                          <Globe className="w-3 h-3 mr-1" />
                          <a
                            href={practitioner.website}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="text-blue-600 hover:underline"
                          >
                            Website
                          </a>
                        </div>
                      )}
                    </div>
                  </TableCell>
                  <TableCell>
                    <div className="flex items-start">
                      <MapPin className="w-3 h-3 mr-1 mt-0.5 flex-shrink-0" />
                      <div className="text-sm">
                        {formatAddress(practitioner)}
                      </div>
                    </div>
                  </TableCell>
                  <TableCell>
                    <div className="space-y-1">
                      {practitioner.insurance.length > 0 && (
                        <div className="flex flex-wrap gap-1">
                          {practitioner.insurance.slice(0, 2).map((ins) => (
                            <Badge
                              key={ins}
                              variant="secondary"
                              className="text-xs"
                            >
                              {ins.replace("_", " ")}
                            </Badge>
                          ))}
                          {practitioner.insurance.length > 2 && (
                            <Badge variant="outline" className="text-xs">
                              +{practitioner.insurance.length - 2} more
                            </Badge>
                          )}
                        </div>
                      )}
                      <div className="flex flex-wrap gap-1">
                        {practitioner.medicare && (
                          <Badge variant="outline" className="text-xs">
                            Medicare
                          </Badge>
                        )}
                        {practitioner.medicaid && (
                          <Badge variant="outline" className="text-xs">
                            Medicaid
                          </Badge>
                        )}
                        {practitioner.tricare && (
                          <Badge variant="outline" className="text-xs">
                            Tricare
                          </Badge>
                        )}
                        {practitioner.workersComp && (
                          <Badge variant="outline" className="text-xs">
                            Workers' Comp
                          </Badge>
                        )}
                      </div>
                    </div>
                  </TableCell>
                  <TableCell>
                    <div className="text-sm">
                      {practitioner.selfPayInitial !== null &&
                        practitioner.selfPayInitial > 0 && (
                          <div>Initial: ${practitioner.selfPayInitial}</div>
                        )}
                      {practitioner.selfPayFollowUp !== null &&
                        practitioner.selfPayFollowUp > 0 && (
                          <div>Follow-up: ${practitioner.selfPayFollowUp}</div>
                        )}
                    </div>
                  </TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </div>

        {totalPages > 1 && (
          <div className="flex items-center justify-between space-x-2 py-4">
            <div className="text-sm text-muted-foreground">
              Page {currentPage} of {totalPages}
            </div>
            <div className="flex space-x-2">
              <Button
                variant="outline"
                size="sm"
                onClick={() => onPageChange(currentPage - 1)}
                disabled={currentPage <= 1}
              >
                Previous
              </Button>
              <Button
                variant="outline"
                size="sm"
                onClick={() => onPageChange(currentPage + 1)}
                disabled={currentPage >= totalPages}
              >
                Next
              </Button>
            </div>
          </div>
        )}
      </CardContent>
    </Card>
  );
}
