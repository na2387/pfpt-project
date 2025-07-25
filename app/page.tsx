"use client";

import { useState, useTransition, useEffect } from "react";
import { ProviderSearch } from "@/components/ProviderSearch";
import { ProvidersDataTable } from "@/components/ProviderDataTable";
import { getPractitioners, SearchFilters } from "@/app/actions/practitioners";
import { Practitioner } from "@/generated/prisma";

export default function ProvidersPage() {
  const [practitioners, setPractitioners] = useState<Practitioner[]>([]);
  const [total, setTotal] = useState(0);
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(0);
  const [currentFilters, setCurrentFilters] = useState<SearchFilters>({});
  const [isPending, startTransition] = useTransition();

  const handleSearch = (filters: SearchFilters) => {
    setCurrentFilters(filters);
    setCurrentPage(1);
    searchPractitioners(filters, 1);
  };

  const handlePageChange = (page: number) => {
    setCurrentPage(page);
    searchPractitioners(currentFilters, page);
  };

  const searchPractitioners = (filters: SearchFilters, page: number) => {
    startTransition(async () => {
      const result = await getPractitioners(filters, page, 10);
      setPractitioners(result.practitioners);
      setTotal(result.total);
      setTotalPages(result.totalPages);
    });
  };

  // Load initial data on component mount
  useEffect(() => {
    searchPractitioners({}, 1);
  }, []); // Empty dependency array means this runs once on mount

  return (
    <div className="container mx-auto p-6 space-y-6">
      <div className="space-y-2">
        <h1 className="text-3xl font-bold">Provider Directory</h1>
        <p className="text-muted-foreground">
          Search and find healthcare providers in your area
        </p>
      </div>

      <ProviderSearch onSearch={handleSearch} isLoading={isPending} />

      <ProvidersDataTable
        practitioners={practitioners}
        total={total}
        currentPage={currentPage}
        totalPages={totalPages}
        onPageChange={handlePageChange}
        isLoading={isPending}
      />
    </div>
  );
}
