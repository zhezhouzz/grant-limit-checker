/// <reference types="vite/client" />

interface KernelResult {
  ok: boolean;
  decision: "allowed" | "blocked" | "review" | "invalid";
  counts: {
    sameType: number;
    total: number;
    leader: number;
    participant: number;
    joint: number;
    mostInternal: number;
    instrumentJoint: number;
  };
  violations: string[];
  reviews: string[];
}

interface Window {
  GrantLimitKernel?: {
    check(title: number, applicationYear: number, candidate: string, existing: string): string;
  };
}
