"use client";

import { useState, useEffect, useCallback, useRef } from "react";
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
import { X, Trash2 } from "lucide-react";
import {
  SearchFilters,
  getAvailableInsurances,
  getAvailableDegrees,
} from "@/app/actions/practitioners";
import { ShareButton } from "@/components/ShareButton";

interface ProviderSearchProps {
  onSearch: (filters: SearchFilters) => void;
  isLoading?: boolean;
  initialFilters?: SearchFilters;
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

// Inline debounce hook
function useDebounce<T>(value: T, delay: number): T {
  const [debouncedValue, setDebouncedValue] = useState<T>(value);

  useEffect(() => {
    const handler = setTimeout(() => {
      setDebouncedValue(value);
    }, delay);

    return () => {
      clearTimeout(handler);
    };
  }, [value, delay]);

  return debouncedValue;
}

export function ProviderSearch({
  onSearch,
  isLoading,
  initialFilters = {},
}: ProviderSearchProps) {
  const [filters, setFilters] = useState<SearchFilters>(initialFilters);
  const [availableInsurances, setAvailableInsurances] = useState<Insurance[]>(
    []
  );
  const [availableDegrees, setAvailableDegrees] = useState<Degree[]>([]);

  // Debounce search to avoid too many API calls
  const debouncedFilters = useDebounce(filters, 500);

  // Load available options on component mount
  useEffect(() => {
    const loadOptions = async () => {
      try {
        const [insurances, degrees] = await Promise.all([
          getAvailableInsurances(),
          getAvailableDegrees(),
        ]);
        setAvailableInsurances(insurances);
        setAvailableDegrees(degrees);
      } catch (error) {
        console.error("Failed to load search options:", error);
      }
    };
    loadOptions();
  }, []);

  useEffect(() => {
    setFilters(initialFilters);
  }, [initialFilters]);

  // Trigger search whenever debounced filters change
  useEffect(() => {
    onSearch(debouncedFilters);
  }, [debouncedFilters, onSearch]);

  const updateFilters = useCallback((newFilters: Partial<SearchFilters>) => {
    setFilters((prev) => ({ ...prev, ...newFilters }));
  }, []);

  const removeFilter = useCallback(
    (filterKey: keyof SearchFilters, value?: string) => {
      setFilters((prev) => {
        const newFilters = { ...prev };

        if (filterKey === "insurance" && value) {
          const currentInsurances = prev.insurance || [];
          newFilters.insurance = currentInsurances.filter(
            (ins) => ins !== value
          );
          if (newFilters.insurance.length === 0) {
            delete newFilters.insurance;
          }
        } else if (filterKey === "degrees" && value) {
          const currentDegrees = prev.degrees || [];
          newFilters.degrees = currentDegrees.filter((deg) => deg !== value);
          if (newFilters.degrees.length === 0) {
            delete newFilters.degrees;
          }
        } else {
          delete newFilters[filterKey];
        }

        return newFilters;
      });
    },
    []
  );

  const clearAllFilters = useCallback(() => {
    setFilters({});
  }, []);

  const addInsurance = useCallback(
    (insuranceName: string) => {
      const currentInsurances = filters.insurance || [];
      if (!currentInsurances.includes(insuranceName)) {
        updateFilters({
          insurance: [...currentInsurances, insuranceName],
        });
      }
    },
    [filters.insurance, updateFilters]
  );

  const addDegree = useCallback(
    (degreeName: string) => {
      const currentDegrees = filters.degrees || [];
      if (!currentDegrees.includes(degreeName)) {
        updateFilters({
          degrees: [...currentDegrees, degreeName],
        });
      }
    },
    [filters.degrees, updateFilters]
  );

  // Count active filters for "Clear All" button
  const activeFilterCount = Object.keys(filters).reduce((count, key) => {
    const value = filters[key as keyof SearchFilters];
    if (!value) return count;
    if (Array.isArray(value)) return count + value.length;
    return count + 1;
  }, 0);

  return (
    <Card className="mb-6">
      <CardHeader className="flex flex-row items-center justify-between">
        <CardTitle>Search</CardTitle>
        <ShareButton />
      </CardHeader>
      <CardContent>
        <div className="space-y-4">
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
            <div className="flex flex-col gap-2">
              <Label htmlFor="name">Provider Name</Label>
              <Input
                id="name"
                placeholder="First or last name"
                value={filters.name || ""}
                onChange={(e) =>
                  updateFilters({ name: e.target.value || undefined })
                }
              />
            </div>

            <div className="flex flex-col gap-2">
              <Label htmlFor="borough">Borough</Label>
              <Select
                value={filters.borough || ""}
                onValueChange={(value) =>
                  updateFilters({
                    borough: value === "all" ? undefined : value,
                  })
                }
              >
                <SelectTrigger>
                  <SelectValue placeholder="Select borough" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">All Boroughs</SelectItem>
                  <SelectItem value="Brooklyn">Brooklyn</SelectItem>
                  <SelectItem value="Bronx">Bronx</SelectItem>
                  <SelectItem value="Manhattan">Manhattan</SelectItem>
                  <SelectItem value="Queens">Queens</SelectItem>
                  <SelectItem value="Staten Island">Staten Island</SelectItem>
                </SelectContent>
              </Select>
            </div>

            <div className="flex flex-col gap-2">
              <Label htmlFor="zip">ZIP Code</Label>
              <Input
                id="zip"
                placeholder="ZIP"
                value={filters.zip || ""}
                onChange={(e) =>
                  updateFilters({ zip: e.target.value || undefined })
                }
              />
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div className="flex flex-col gap-2">
              <Label>Insurance Plans</Label>
              <Select value="" onValueChange={(value) => addInsurance(value)}>
                <SelectTrigger>
                  <SelectValue placeholder="Add insurance plans" />
                </SelectTrigger>
                <SelectContent>
                  {availableInsurances.map((insurance) => (
                    <SelectItem key={insurance.id} value={insurance.name}>
                      {insurance.name} ({insurance._count.practitioners})
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>

            <div className="flex flex-col gap-2">
              <Label>Degrees/Certifications</Label>
              <Select value="" onValueChange={(value) => addDegree(value)}>
                <SelectTrigger>
                  <SelectValue placeholder="Add degrees/certifications" />
                </SelectTrigger>
                <SelectContent>
                  {availableDegrees.map((degree) => (
                    <SelectItem key={degree.id} value={degree.name}>
                      {degree.name} ({degree._count.practitioners})
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>
          </div>

          {/* Active Filters Section */}
          {activeFilterCount > 0 && (
            <div className="border-t pt-4">
              <div className="flex items-center justify-between mb-3">
                <Label className="text-sm font-medium">Active Filters:</Label>
                {activeFilterCount > 1 && (
                  <Button
                    variant="ghost"
                    size="sm"
                    onClick={clearAllFilters}
                    className="h-6 px-2 text-xs"
                  >
                    <Trash2 className="h-3 w-3 mr-1" />
                    Clear All
                  </Button>
                )}
              </div>

              <div className="flex flex-wrap gap-2">
                {/* Name filter */}
                {filters.name && (
                  <Badge
                    variant="secondary"
                    className="flex items-center gap-1"
                  >
                    Name: {filters.name}
                    <button
                      type="button"
                      className="ml-1 inline-flex items-center justify-center"
                      onClick={(e) => {
                        e.preventDefault();
                        e.stopPropagation();
                        removeFilter("name");
                      }}
                    >
                      <X className="h-3 w-3 cursor-pointer hover:text-destructive" />
                    </button>
                  </Badge>
                )}

                {/* Borough filter */}
                {filters.borough && (
                  <Badge
                    variant="secondary"
                    className="flex items-center gap-1"
                  >
                    Borough: {filters.borough}
                    <button
                      type="button"
                      className="ml-1 inline-flex items-center justify-center"
                      onClick={(e) => {
                        e.preventDefault();
                        e.stopPropagation();
                        removeFilter("borough");
                      }}
                    >
                      <X className="h-3 w-3 cursor-pointer hover:text-destructive" />
                    </button>
                  </Badge>
                )}

                {/* ZIP filter */}
                {filters.zip && (
                  <Badge
                    variant="secondary"
                    className="flex items-center gap-1"
                  >
                    ZIP: {filters.zip}
                    <button
                      type="button"
                      className="ml-1 inline-flex items-center justify-center"
                      onClick={(e) => {
                        e.preventDefault();
                        e.stopPropagation();
                        removeFilter("zip");
                      }}
                    >
                      <X className="h-3 w-3 cursor-pointer hover:text-destructive" />
                    </button>
                  </Badge>
                )}

                {/* Insurance filters */}
                {filters.insurance?.map((insuranceName) => (
                  <Badge
                    key={insuranceName}
                    variant="outline"
                    className="flex items-center gap-1"
                  >
                    {insuranceName}
                    <button
                      type="button"
                      className="ml-1 inline-flex items-center justify-center"
                      onClick={(e) => {
                        e.preventDefault();
                        e.stopPropagation();
                        removeFilter("insurance", insuranceName);
                      }}
                    >
                      <X className="h-3 w-3 cursor-pointer hover:text-destructive" />
                    </button>
                  </Badge>
                ))}

                {/* Degree filters */}
                {filters.degrees?.map((degreeName) => (
                  <Badge
                    key={degreeName}
                    variant="outline"
                    className="flex items-center gap-1"
                  >
                    {degreeName}
                    <button
                      type="button"
                      className="ml-1 inline-flex items-center justify-center"
                      onClick={(e) => {
                        e.preventDefault();
                        e.stopPropagation();
                        removeFilter("degrees", degreeName);
                      }}
                    >
                      <X className="h-3 w-3 cursor-pointer hover:text-destructive" />
                    </button>
                  </Badge>
                ))}
              </div>
            </div>
          )}

          {/* Loading indicator */}
          {isLoading && (
            <div className="text-center py-2">
              <div className="text-sm text-muted-foreground">Searching...</div>
            </div>
          )}
        </div>
      </CardContent>
    </Card>
  );
}
