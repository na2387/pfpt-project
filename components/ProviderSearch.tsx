"use client";

import { useState, useEffect } from "react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { Badge } from "@/components/ui/badge";
import { X } from "lucide-react";
import {
  SearchFilters,
  getAvailableInsurances,
  getAvailableDegrees,
} from "@/app/actions/practitioners";

interface ProviderSearchProps {
  onSearch: (filters: SearchFilters) => void;
  isLoading?: boolean;
}

interface Insurance {
  id: string;
  name: string;
  _count: {
    practitioners: number;
  };
}

interface Degree {
  id: string;
  name: string;
  _count: {
    practitioners: number;
  };
}

export function ProviderSearch({ onSearch, isLoading }: ProviderSearchProps) {
  const [filters, setFilters] = useState<SearchFilters>({});
  const [availableInsurances, setAvailableInsurances] = useState<Insurance[]>(
    []
  );
  const [availableDegrees, setAvailableDegrees] = useState<Degree[]>([]);

  // Load available options on component mount
  useEffect(() => {
    const loadOptions = async () => {
      const [insurances, degrees] = await Promise.all([
        getAvailableInsurances(),
        getAvailableDegrees(),
      ]);
      setAvailableInsurances(insurances);
      setAvailableDegrees(degrees);
    };
    loadOptions();
  }, []);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSearch(filters);
  };

  const handleReset = () => {
    setFilters({});
    onSearch({});
  };

  const addInsurance = (insuranceName: string) => {
    const currentInsurances = filters.insurance || [];
    if (!currentInsurances.includes(insuranceName)) {
      setFilters({
        ...filters,
        insurance: [...currentInsurances, insuranceName],
      });
    }
  };

  const removeInsurance = (insuranceName: string) => {
    const currentInsurances = filters.insurance || [];
    setFilters({
      ...filters,
      insurance: currentInsurances.filter((name) => name !== insuranceName),
    });
  };

  const addDegree = (degreeName: string) => {
    const currentDegrees = filters.degrees || [];
    if (!currentDegrees.includes(degreeName)) {
      setFilters({
        ...filters,
        degrees: [...currentDegrees, degreeName],
      });
    }
  };

  const removeDegree = (degreeName: string) => {
    const currentDegrees = filters.degrees || [];
    setFilters({
      ...filters,
      degrees: currentDegrees.filter((name) => name !== degreeName),
    });
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
              <Label htmlFor="borough">Borough</Label>
              <Input
                id="borough"
                placeholder="Borough"
                value={filters.borough || ""}
                onChange={(e) =>
                  setFilters({ ...filters, borough: e.target.value })
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
            <Select value="" onValueChange={(value) => addInsurance(value)}>
              <SelectTrigger>
                <SelectValue placeholder="Select insurance plans" />
              </SelectTrigger>
              <SelectContent>
                {availableInsurances.map((insurance) => (
                  <SelectItem key={insurance.id} value={insurance.name}>
                    {insurance.name} ({insurance._count.practitioners})
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>

            {/* Selected Insurance Badges */}
            {filters.insurance && filters.insurance.length > 0 && (
              <div className="flex flex-wrap gap-2 mt-2">
                {filters.insurance.map((insuranceName) => (
                  <Badge
                    key={insuranceName}
                    variant="secondary"
                    className="flex items-center gap-1"
                  >
                    {insuranceName}
                    <X
                      className="h-3 w-3 cursor-pointer"
                      onClick={() => removeInsurance(insuranceName)}
                    />
                  </Badge>
                ))}
              </div>
            )}
          </div>

          <div>
            <Label>Degrees/Certifications</Label>
            <Select value="" onValueChange={(value) => addDegree(value)}>
              <SelectTrigger>
                <SelectValue placeholder="Select degrees/certifications" />
              </SelectTrigger>
              <SelectContent>
                {availableDegrees.map((degree) => (
                  <SelectItem key={degree.id} value={degree.name}>
                    {degree.name} ({degree._count.practitioners})
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>

            {/* Selected Degree Badges */}
            {filters.degrees && filters.degrees.length > 0 && (
              <div className="flex flex-wrap gap-2 mt-2">
                {filters.degrees.map((degreeName) => (
                  <Badge
                    key={degreeName}
                    variant="secondary"
                    className="flex items-center gap-1"
                  >
                    {degreeName}
                    <X
                      className="h-3 w-3 cursor-pointer"
                      onClick={() => removeDegree(degreeName)}
                    />
                  </Badge>
                ))}
              </div>
            )}
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
