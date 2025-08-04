"use client";

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
import {
  HoverCard,
  HoverCardContent,
  HoverCardTrigger,
} from "@/components/ui/hover-card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import {
  Phone,
  Globe,
  MapPin,
  ArrowUpDown,
  ArrowUp,
  ArrowDown,
} from "lucide-react";
import {
  SortField,
  SortDirection,
  SortOptions,
} from "@/app/actions/practitioners";
import { Pagination } from "@/components/Pagination";

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
  _count: {
    insurances: number;
  };
}

interface ProvidersDataTableProps {
  practitioners: PractitionerWithRelations[];
  total: number;
  currentPage: number;
  totalPages: number;
  onPageChange: (page: number) => void;
  onSort: (sort: SortOptions) => void;
  currentSort: SortOptions;
  isLoading?: boolean;
}

// Sortable header component
function SortableHeader({
  field,
  currentSort,
  onSort,
  children,
}: {
  field: SortField;
  currentSort: SortOptions;
  onSort: (sort: SortOptions) => void;
  children: React.ReactNode;
}) {
  const isActive = currentSort.field === field;
  const nextDirection: SortDirection =
    isActive && currentSort.direction === "asc" ? "desc" : "asc";

  const handleSort = () => {
    onSort({ field, direction: nextDirection });
  };

  const getSortIcon = () => {
    if (!isActive) {
      return <ArrowUpDown className="ml-2 h-4 w-4 text-muted-foreground" />;
    }
    return currentSort.direction === "asc" ? (
      <ArrowUp className="ml-2 h-4 w-4" />
    ) : (
      <ArrowDown className="ml-2 h-4 w-4" />
    );
  };

  return (
    <Button
      variant="ghost"
      onClick={handleSort}
      className="h-auto p-0 font-medium hover:bg-transparent"
    >
      {children}
      {getSortIcon()}
    </Button>
  );
}

function InsuranceDisplay({
  insurances,
}: {
  insurances: { insurance: { id: string; name: string } }[];
}) {
  const displayCount = 3;
  const visibleInsurances = insurances.slice(0, displayCount);
  const hiddenCount = insurances.slice(displayCount);
  const hasMore = hiddenCount.length > 0;

  if (insurances.length === 0) {
    return (
      <div className="text-xs text-muted-foreground">No insurance info</div>
    );
  }

  return (
    <div className="space-y-1">
      <div className="flex flex-wrap gap-1">
        {visibleInsurances.map((relation) => (
          <Badge
            key={relation.insurance.id}
            variant="secondary"
            className="text-xs"
          >
            {relation.insurance.name}
          </Badge>
        ))}

        {hasMore && (
          <HoverCard>
            <HoverCardTrigger asChild>
              <Badge
                variant="outline"
                className="text-xs cursor-pointer hover:bg-muted transition-colors"
              >
                +{hiddenCount.length} more
              </Badge>
            </HoverCardTrigger>
            <HoverCardContent className="w-64">
              <div className="space-y-2">
                <h4 className="text-sm font-semibold">
                  All Accepted Insurance Plans
                </h4>
                <div className="grid grid-cols-1 gap-1 max-h-60 overflow-y-auto">
                  {insurances.map((relation, index) => (
                    <div
                      key={relation.insurance.id}
                      className={`text-sm p-2 rounded ${
                        index < displayCount ? "bg-muted" : "bg-background"
                      }`}
                    >
                      {relation.insurance.name}
                      {index < displayCount && (
                        <span className="text-xs text-muted-foreground ml-2">
                          (shown above)
                        </span>
                      )}
                    </div>
                  ))}
                </div>
                <div className="text-xs text-muted-foreground border-t pt-2">
                  Total {insurances.length} insurance plans
                  {insurances.length !== 1 ? "s" : ""}
                </div>
              </div>
            </HoverCardContent>
          </HoverCard>
        )}
      </div>
    </div>
  );
}

export function ProvidersDataTable({
  practitioners,
  total,
  currentPage,
  totalPages,
  onPageChange,
  onSort,
  currentSort,
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
          Found {total} provider{total !== 1 ? "s" : ""} • Sorted by{" "}
          {currentSort.field === "name"
            ? "Provider Name"
            : currentSort.field === "insurance_count"
            ? "Insurance Count"
            : "Self-Pay Rates"}{" "}
          ({currentSort.direction === "asc" ? "A-Z" : "Z-A"})
        </CardDescription>
      </CardHeader>
      <CardContent>
        <div className="rounded-md border">
          <Table>
            <TableHeader>
              <TableRow>
                <TableHead>
                  <SortableHeader
                    field="name"
                    currentSort={currentSort}
                    onSort={onSort}
                  >
                    Provider
                  </SortableHeader>
                </TableHead>
                <TableHead>Contact</TableHead>
                <TableHead>Location</TableHead>
                <TableHead>
                  <SortableHeader
                    field="insurance_count"
                    currentSort={currentSort}
                    onSort={onSort}
                  >
                    Insurance (
                    {practitioners.length > 0
                      ? practitioners[0]._count
                        ? "Count"
                        : ""
                      : ""}
                    )
                  </SortableHeader>
                </TableHead>
                <TableHead>
                  <SortableHeader
                    field="self_pay"
                    currentSort={currentSort}
                    onSort={onSort}
                  >
                    Self-Pay Rates
                  </SortableHeader>
                </TableHead>
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
                      <InsuranceDisplay insurances={practitioner.insurances} />
                      <div className="text-xs text-muted-foreground">
                        {practitioner._count?.insurances ||
                          practitioner.insurances.length}{" "}
                        plan
                        {(practitioner._count?.insurances ||
                          practitioner.insurances.length) !== 1
                          ? "s"
                          : ""}
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

        <Pagination
          currentPage={currentPage}
          totalPages={totalPages}
          onPageChange={onPageChange}
          isLoading={isLoading}
        />
      </CardContent>
    </Card>
  );
}
