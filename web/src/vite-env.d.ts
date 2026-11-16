/// <reference types="vite/client" />

interface KernelResult {
  ok: boolean;
  decision: "allowed" | "blocked" | "invalid";
  counts: {
    sameType: number;
    total: number;
    leader: number;
    participant: number;
    joint: number;
  };
  violations: string[];
}

interface Window {
  GrantLimitKernel?: {
    check(title: number, applicationYear: number, candidate: string, existing: string): string;
  };
}
