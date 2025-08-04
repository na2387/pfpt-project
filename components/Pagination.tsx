import { Button } from "@/components/ui/button";
import { ChevronLeft, ChevronRight, MoreHorizontal } from "lucide-react";

interface PaginationProps {
  currentPage: number;
  totalPages: number;
  onPageChange: (page: number) => void;
  isLoading?: boolean;
}

export function Pagination({
  currentPage,
  totalPages,
  onPageChange,
  isLoading,
}: PaginationProps) {
  // Don't show pagination if there's only one page
  if (totalPages <= 1) return null;

  const getPageNumbers = () => {
    const delta = 2; // Number of pages to show around current page
    const range = [];
    const rangeWithDots = [];

    // Calculate start and end of range around current page
    const start = Math.max(2, currentPage - delta);
    const end = Math.min(totalPages - 1, currentPage + delta);

    for (let i = start; i <= end; i++) {
      range.push(i);
    }

    // Always show first page
    if (start > 2) {
      rangeWithDots.push(1, "...");
    } else {
      rangeWithDots.push(1);
    }

    // Add the range around current page
    rangeWithDots.push(...range);

    // Always show last page
    if (end < totalPages - 1) {
      rangeWithDots.push("...", totalPages);
    } else if (totalPages > 1) {
      rangeWithDots.push(totalPages);
    }

    return rangeWithDots;
  };

  const pageNumbers = getPageNumbers();

  return (
    <div className="flex items-center justify-between space-x-2 py-4">
      <div className="text-sm text-muted-foreground">
        Page {currentPage} of {totalPages}
      </div>

      <div className="flex items-center space-x-1">
        {/* Previous button */}
        <Button
          variant="outline"
          size="sm"
          onClick={() => onPageChange(currentPage - 1)}
          disabled={currentPage <= 1 || isLoading}
          className="h-8 w-8 p-0"
        >
          <ChevronLeft className="h-4 w-4" />
          <span className="sr-only">Previous page</span>
        </Button>

        {/* Page numbers */}
        <div className="flex items-center space-x-1">
          {pageNumbers.map((pageNumber, index) => {
            if (pageNumber === "...") {
              return (
                <div
                  key={`dots-${index}`}
                  className="flex h-8 w-8 items-center justify-center"
                >
                  <MoreHorizontal className="h-4 w-4" />
                </div>
              );
            }

            const isCurrentPage = pageNumber === currentPage;

            return (
              <Button
                key={pageNumber}
                variant={isCurrentPage ? "default" : "outline"}
                size="sm"
                onClick={() => onPageChange(pageNumber as number)}
                disabled={isLoading}
                className="h-8 w-8 p-0"
              >
                {pageNumber}
              </Button>
            );
          })}
        </div>

        {/* Next button */}
        <Button
          variant="outline"
          size="sm"
          onClick={() => onPageChange(currentPage + 1)}
          disabled={currentPage >= totalPages || isLoading}
          className="h-8 w-8 p-0"
        >
          <ChevronRight className="h-4 w-4" />
          <span className="sr-only">Next page</span>
        </Button>
      </div>
    </div>
  );
}
