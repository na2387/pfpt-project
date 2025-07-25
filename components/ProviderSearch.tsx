"use client";

import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Checkbox } from "@/components/ui/checkbox";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { INSURANCE } from "@/generated/prisma";
import { SearchFilters } from "@/app/actions/practitioners";

interface ProviderSearchProps {
  onSearch: (filters: SearchFilters) => void;
  isLoading?: boolean;
}

const INSURANCE_OPTIONS = [
  { value: INSURANCE.AETNA, label: "Aetna" },
  { value: INSURANCE.BCBS, label: "Blue Cross Blue Shield" },
  { value: INSURANCE.CIGNA, label: "Cigna" },
  { value: INSURANCE.OXFORD, label: "Oxford" },
  { value: INSURANCE.UHC, label: "United Healthcare" },
  { value: INSURANCE.HORIZON, label: "Horizon" },
  { value: INSURANCE.HEALTH_NET, label: "Health Net" },
  { value: INSURANCE.MEDICARE, label: "Medicare" },
];

export function ProviderSearch({ onSearch, isLoading }: ProviderSearchProps) {
  const [filters, setFilters] = useState<SearchFilters>({});

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSearch(filters);
  };

  const handleReset = () => {
    setFilters({});
    onSearch({});
  };

  return (
    <Card className="mb-6">
      <CardHeader>
        <CardTitle>Find Healthcare Providers</CardTitle>
      </CardHeader>
      <CardContent>
        <form onSubmit={handleSubmit} className="space-y-4">
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
            <div>
              <Label htmlFor="name">Provider Name</Label>
              <Input
                id="name"
                placeholder="First or last name"
                value={filters.name || ""}
                onChange={(e) =>
                  setFilters({ ...filters, name: e.target.value })
                }
              />
            </div>
            <div>
              <Label htmlFor="city">City</Label>
              <Input
                id="city"
                placeholder="City"
                value={filters.city || ""}
                onChange={(e) =>
                  setFilters({ ...filters, city: e.target.value })
                }
              />
            </div>
            <div>
              <Label htmlFor="state">State</Label>
              <Input
                id="state"
                placeholder="State"
                value={filters.state || ""}
                onChange={(e) =>
                  setFilters({ ...filters, state: e.target.value })
                }
              />
            </div>
            <div>
              <Label htmlFor="zip">ZIP Code</Label>
              <Input
                id="zip"
                placeholder="ZIP"
                value={filters.zip || ""}
                onChange={(e) =>
                  setFilters({ ...filters, zip: e.target.value })
                }
              />
            </div>
          </div>

          <div>
            <Label>Insurance Plans</Label>
            <Select
              value={filters.insurance?.[0] || ""}
              onValueChange={(value) =>
                setFilters({
                  ...filters,
                  insurance: value ? [value as INSURANCE] : undefined,
                })
              }
            >
              <SelectTrigger>
                <SelectValue placeholder="Select insurance plan" />
              </SelectTrigger>
              <SelectContent>
                {INSURANCE_OPTIONS.map((option) => (
                  <SelectItem key={option.value} value={option.value}>
                    {option.label}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>

          <div className="flex flex-wrap gap-4">
            <div className="flex items-center space-x-2">
              <Checkbox
                id="medicare"
                checked={filters.medicare || false}
                onCheckedChange={(checked) =>
                  setFilters({ ...filters, medicare: checked as boolean })
                }
              />
              <Label htmlFor="medicare">Accepts Medicare</Label>
            </div>
            <div className="flex items-center space-x-2">
              <Checkbox
                id="medicaid"
                checked={filters.medicaid || false}
                onCheckedChange={(checked) =>
                  setFilters({ ...filters, medicaid: checked as boolean })
                }
              />
              <Label htmlFor="medicaid">Accepts Medicaid</Label>
            </div>
            <div className="flex items-center space-x-2">
              <Checkbox
                id="tricare"
                checked={filters.tricare || false}
                onCheckedChange={(checked) =>
                  setFilters({ ...filters, tricare: checked as boolean })
                }
              />
              <Label htmlFor="tricare">Accepts Tricare</Label>
            </div>
            <div className="flex items-center space-x-2">
              <Checkbox
                id="workersComp"
                checked={filters.workersComp || false}
                onCheckedChange={(checked) =>
                  setFilters({ ...filters, workersComp: checked as boolean })
                }
              />
              <Label htmlFor="workersComp">Accepts Workers' Comp</Label>
            </div>
          </div>

          <div className="flex gap-2">
            <Button type="submit" disabled={isLoading}>
              {isLoading ? "Searching..." : "Search"}
            </Button>
            <Button type="button" variant="outline" onClick={handleReset}>
              Clear Filters
            </Button>
          </div>
        </form>
      </CardContent>
    </Card>
  );
}
