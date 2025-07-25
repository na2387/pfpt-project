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
import { Phone, Globe, MapPin } from "lucide-react";

// Update the type to match your relational data
interface PractitionerWithRelations {
  id: string;
  firstName: string | null;
  lastName: string;
  phone: string | null;
  address: string | null;
  borough: string | null;
  state: string | null;
  zip: string | null;
  website: string | null;
  cert: string | null;
  selfPayInitial: number | null;
  selfPayFollowUp: number | null;
  degrees: {
    degree: {
      id: string;
      name: string;
    };
  }[];
  insurances: {
    insurance: {
      id: string;
      name: string;
    };
  }[];
}

interface ProvidersDataTableProps {
  practitioners: PractitionerWithRelations[];
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
  const formatAddress = (practitioner: PractitionerWithRelations) => {
    const parts = [
      practitioner.address,
      practitioner.borough,
      practitioner.state,
      practitioner.zip,
    ].filter(Boolean);
    return parts.join(", ");
  };

  const formatDegrees = (degrees: { degree: { name: string } }[]) => {
    return degrees.map((d) => d.degree.name).join(", ");
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
                      {practitioner.degrees.length > 0 && (
                        <div className="text-sm text-muted-foreground">
                          {formatDegrees(practitioner.degrees)}
                        </div>
                      )}
                      {practitioner.cert && (
                        <div className="text-xs text-muted-foreground">
                          Cert: {practitioner.cert}
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
                      {practitioner.insurances.length > 0 ? (
                        <div className="flex flex-wrap gap-1">
                          {practitioner.insurances
                            .slice(0, 3)
                            .map((relation) => (
                              <Badge
                                key={relation.insurance.id}
                                variant="secondary"
                                className="text-xs"
                              >
                                {relation.insurance.name}
                              </Badge>
                            ))}
                          {practitioner.insurances.length > 3 && (
                            <Badge variant="outline" className="text-xs">
                              +{practitioner.insurances.length - 3} more
                            </Badge>
                          )}
                        </div>
                      ) : (
                        <div className="text-xs text-muted-foreground">
                          No insurance info
                        </div>
                      )}
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
                      {(!practitioner.selfPayInitial ||
                        practitioner.selfPayInitial === 0) &&
                        (!practitioner.selfPayFollowUp ||
                          practitioner.selfPayFollowUp === 0) && (
                          <div className="text-muted-foreground">
                            Contact for rates
                          </div>
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
