"use client";

import { useState, useCallback, useEffect, useRef, Suspense } from "react";
import { useRouter, useSearchParams } from "next/navigation";
import { useQuery, useQueryClient } from "@tanstack/react-query";
import { ProviderSearch } from "@/components/ProviderSearch";
import { ProvidersDataTable } from "@/components/ProvidersDataTable";
import {
  getPractitioners,
  SearchFilters,
  SortOptions,
} from "@/app/actions/practitioners";

function ProvidersPageContent() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const queryClient = useQueryClient();

  // State initialization
  const [currentFilters, setCurrentFilters] = useState<SearchFilters>({});
  const [currentPage, setCurrentPage] = useState(1);
  const [currentSort, setCurrentSort] = useState<SortOptions>({
    field: "name",
    direction: "asc",
  });
  const [isInitialized, setIsInitialized] = useState(false);

  // Track if we're updating from internal state vs URL
  const isInternalUpdate = useRef(false);

  // Initialize state from URL parameters
  useEffect(() => {
    const filters: SearchFilters = {};
    const page = parseInt(searchParams.get("page") || "1", 10);
    const sortField = (searchParams.get("sortField") ||
      "name") as SortOptions["field"];
    const sortDirection = (searchParams.get("sortDirection") ||
      "asc") as SortOptions["direction"];

    // Extract filters from URL
    if (searchParams.get("name")) filters.name = searchParams.get("name")!;
    if (searchParams.get("borough"))
      filters.borough = searchParams.get("borough")!;
    if (searchParams.get("state")) filters.state = searchParams.get("state")!;
    if (searchParams.get("zip")) filters.zip = searchParams.get("zip")!;

    // Handle array parameters
    const insuranceParam = searchParams.get("insurance");
    if (insuranceParam) {
      filters.insurance = insuranceParam.split(",").filter(Boolean);
    }

    const degreesParam = searchParams.get("degrees");
    if (degreesParam) {
      filters.degrees = degreesParam.split(",").filter(Boolean);
    }

    // Only update state if this is not an internal update
    if (!isInternalUpdate.current) {
      setCurrentFilters(filters);
      setCurrentPage(page);
      setCurrentSort({ field: sortField, direction: sortDirection });
    }

    setIsInitialized(true);
    isInternalUpdate.current = false; // Reset flag
  }, [searchParams]);

  // Update URL when state changes
  const updateURL = useCallback(
    (
      filters: SearchFilters,
      page: number,
      sort: SortOptions,
      replace = false
    ) => {
      isInternalUpdate.current = true; // Set flag before URL update

      const params = new URLSearchParams();

      // Add filters to URL
      if (filters.name) params.set("name", filters.name);
      if (filters.borough) params.set("borough", filters.borough);
      if (filters.state) params.set("state", filters.state);
      if (filters.zip) params.set("zip", filters.zip);
      if (filters.insurance?.length)
        params.set("insurance", filters.insurance.join(","));
      if (filters.degrees?.length)
        params.set("degrees", filters.degrees.join(","));

      // Add pagination and sorting
      if (page > 1) params.set("page", page.toString());
      if (sort.field !== "name") params.set("sortField", sort.field);
      if (sort.direction !== "asc") params.set("sortDirection", sort.direction);

      const newURL = params.toString() ? `?${params.toString()}` : "/";

      if (replace) {
        router.replace(newURL, { scroll: false });
      } else {
        router.push(newURL, { scroll: false });
      }
    },
    [router]
  );

  // Create a query key that includes all search parameters
  const queryKey = ["practitioners", currentFilters, currentPage, currentSort];

  const { data, isLoading } = useQuery({
    queryKey,
    queryFn: () =>
      getPractitioners(currentFilters, currentPage, 10, currentSort),
    staleTime: 2 * 60 * 1000,
    gcTime: 5 * 60 * 1000,
    enabled: isInitialized,
  });

  // Prefetch next page for better UX
  const prefetchNextPage = useCallback(() => {
    if (data?.totalPages && currentPage < data.totalPages) {
      queryClient.prefetchQuery({
        queryKey: [
          "practitioners",
          currentFilters,
          currentPage + 1,
          currentSort,
        ],
        queryFn: () =>
          getPractitioners(currentFilters, currentPage + 1, 10, currentSort),
        staleTime: 2 * 60 * 1000,
      });
    }
  }, [data?.totalPages, currentPage, currentFilters, currentSort, queryClient]);

  // Prefetch on data load
  useEffect(() => {
    if (data) {
      setTimeout(prefetchNextPage, 1000);
    }
  }, [data, prefetchNextPage]);

  // UPDATED: Only reset page for actual search changes, not URL updates
  const handleSearch = useCallback(
    (filters: SearchFilters) => {
      // Check if filters actually changed
      const filtersChanged =
        JSON.stringify(filters) !== JSON.stringify(currentFilters);

      if (filtersChanged) {
        const newPage = 1; // Reset to first page only if filters changed
        setCurrentFilters(filters);
        setCurrentPage(newPage);
        updateURL(filters, newPage, currentSort, false);
      }
    },
    [currentFilters, currentSort, updateURL]
  );

  const handlePageChange = useCallback(
    (page: number) => {
      setCurrentPage(page);
      updateURL(currentFilters, page, currentSort, false);
      setTimeout(prefetchNextPage, 100);
    },
    [currentFilters, currentSort, updateURL, prefetchNextPage]
  );

  const handleSort = useCallback(
    (sort: SortOptions) => {
      const newPage = 1; // Reset to first page when sorting
      setCurrentSort(sort);
      setCurrentPage(newPage);
      updateURL(currentFilters, newPage, sort, false);
    },
    [currentFilters, updateURL]
  );

  const practitioners = data?.practitioners || [];
  const total = data?.total || 0;
  const totalPages = data?.totalPages || 0;

  // Don't render until initialized
  if (!isInitialized) {
    return (
      <div className="container mx-auto py-8">
        <div className="flex items-center justify-center h-32">
          <div className="text-muted-foreground">Loading...</div>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-background">
      <div className="container mx-auto px-4 py-8 max-w-7xl">
        <div className="space-y-6">
          <div className="text-center space-y-2">
            <h1 className="text-3xl font-bold tracking-tight sm:text-4xl">
              Find Pelvic Floor Physical Therapists in the NYC Area
            </h1>
          </div>

          <ProviderSearch
            onSearch={handleSearch}
            isLoading={isLoading}
            initialFilters={currentFilters}
          />

          <ProvidersDataTable
            practitioners={practitioners}
            total={total}
            currentPage={currentPage}
            totalPages={totalPages}
            onPageChange={handlePageChange}
            onSort={handleSort}
            currentSort={currentSort}
            isLoading={isLoading}
          />
        </div>
      </div>
    </div>
  );
}

function LoadingFallback() {
  return (
    <div className="container mx-auto px-4 py-8">
      <div className="flex items-center justify-center h-32">
        <div className="text-muted-foreground">Loading...</div>
      </div>
    </div>
  );
}

export default function ProvidersPage() {
  return (
    <Suspense fallback={<LoadingFallback />}>
      <ProvidersPageContent />
    </Suspense>
  );
}
