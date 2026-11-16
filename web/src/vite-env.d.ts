/// <reference types="vite/client" />

interface KernelResult {
  ok: boolean;
  decision: "allowed" | "blocked" | "invalid";
  counts: {
    sameType: number;
    total: number;
    leader: number;
    participant: number;
  };
  violations: string[];
}

interface Window {
  GrantLimitKernel?: {
    check(title: number, candidate: string, existing: string): string;
  };
}
