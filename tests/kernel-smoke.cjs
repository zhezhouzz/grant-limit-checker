const assert = require("node:assert/strict");
const fs = require("node:fs");
const vm = require("node:vm");

const kernelPath = "web/public/kernel.js";
const kernelBytes = fs.statSync(kernelPath).size;
assert.ok(kernelBytes < 200_000, `OCaml kernel is ${kernelBytes} bytes; expected below 200 KB`);

const context = { console, TextEncoder, TextDecoder, performance, process, require };
vm.createContext(context);
vm.runInContext(fs.readFileSync(kernelPath, "utf8"), context);
const kernel = context.GrantLimitKernel;
assert.ok(kernel, "OCaml kernel should export GrantLimitKernel");

function project(overrides = {}) {
  const value = {
    kind: 0,
    guide: 0,
    tag: 0,
    role: 0,
    status: 0,
    approvalYear: 2026,
    endYear: 2029,
    endMonth: 12,
    endDay: 31,
    directCost: 0,
    centralBudget: 0,
    title: 0,
    ...overrides
  };
  return [
    value.kind, value.guide, value.tag, value.role, value.status,
    value.approvalYear, value.endYear, value.endMonth, value.endDay,
    value.directCost, value.centralBudget, value.title
  ].join(",");
}

function check(candidate, existing = [], title = 0, applicationYear = 2026) {
  return JSON.parse(kernel.check(title, applicationYear, candidate, existing.join(";")));
}

const empty = check(project());
assert.equal(empty.decision, "allowed");
assert.equal(empty.counts.total, 1);

const third = check(project(), [
  project({ role: 1, status: 3, approvalYear: 2024, endYear: 2027 }),
  project({ kind: 1, role: 1, status: 3, approvalYear: 2024, endYear: 2028 })
]);
assert.equal(third.decision, "blocked");
assert.deepEqual(third.violations, ["NSFC-2026-TOTAL-SENIOR-2"]);

const exactly200 = check(project(), [
  project({ kind: 10, role: 1, status: 3, approvalYear: 2025, endYear: 2028, directCost: 200 })
]);
const over200 = check(project(), [
  project({ kind: 10, role: 1, status: 3, approvalYear: 2025, endYear: 2028, directCost: 201 })
]);
assert.equal(exactly200.counts.total, 1);
assert.equal(over200.counts.total, 2);

const nsfcEndsInApplicationYear = check(project(), [
  project({ role: 1, status: 3, approvalYear: 2024, endYear: 2026 })
]);
assert.equal(nsfcEndsInApplicationYear.counts.total, 1);

const participantDoesNotTriggerSameType = check(
  project({ role: 2 }),
  [project({ role: 0, status: 0 })]
);
assert.equal(participantDoesNotTriggerSameType.decision, "allowed");
assert.equal(participantDoesNotTriggerSameType.counts.sameType, 0);

const previousYearSameTypeAward = check(project(), [
  project({ role: 1, status: 3, approvalYear: 2025, endYear: 2028 })
]);
assert.equal(previousYearSameTypeAward.decision, "blocked");
assert.ok(previousYearSameTypeAward.violations.includes("NSFC-2026-GENERAL-2"));

const jointThird = check(
  project({ kind: 18, guide: 2, role: 1, approvalYear: 2027, endYear: 2030 }),
  [
    project({ kind: 2, role: 1, status: 3, approvalYear: 2025, endYear: 2028 }),
    project({ kind: 17, guide: 3, role: 3, status: 1, approvalYear: 2025, endYear: 2029 })
  ]
);
assert.equal(jointThird.decision, "blocked");
assert.equal(jointThird.counts.joint, 3);
assert.ok(jointThird.violations.includes("JOINT-2022-107-LIMIT-2"));

const youngScientist = check(
  project({ kind: 17, guide: 2, tag: 1, role: 5, approvalYear: 2027, endYear: 2030 }),
  [
    project({ kind: 2, role: 1, status: 3, approvalYear: 2025, endYear: 2028 }),
    project({ kind: 17, guide: 3, role: 3, status: 3, approvalYear: 2025, endYear: 2029 })
  ]
);
assert.equal(youngScientist.decision, "allowed");
assert.equal(youngScientist.counts.joint, 2);

const activePrincipalEndsDec31 = check(
  project({ kind: 17, guide: 2, role: 5, approvalYear: 2027, endYear: 2030 }),
  [project({ kind: 17, guide: 3, role: 1, status: 3, approvalYear: 2025,
    endYear: 2026, endMonth: 12, endDay: 31 })]
);
assert.equal(activePrincipalEndsDec31.decision, "blocked");
assert.ok(activePrincipalEndsDec31.violations.includes("MOST-2026-ACTIVE-PROJECT-PRINCIPAL"));

const activePrincipalEndedDec30 = check(
  project({ kind: 17, guide: 2, role: 5, approvalYear: 2027, endYear: 2030 }),
  [project({ kind: 17, guide: 3, role: 1, status: 3, approvalYear: 2025,
    endYear: 2026, endMonth: 12, endDay: 30 })]
);
assert.equal(activePrincipalEndedDec30.decision, "allowed");

const activeTaskPrincipalParticipates = check(
  project({ kind: 17, guide: 2, role: 5, approvalYear: 2027, endYear: 2030 }),
  [project({ kind: 17, guide: 3, role: 3, status: 3, approvalYear: 2025, endYear: 2029 })]
);
assert.equal(activeTaskPrincipalParticipates.decision, "allowed");

const activeTaskPrincipalLeads = check(
  project({ kind: 17, guide: 2, role: 3, approvalYear: 2027, endYear: 2030 }),
  [project({ kind: 17, guide: 3, role: 3, status: 3, approvalYear: 2025, endYear: 2029 })]
);
assert.equal(activeTaskPrincipalLeads.decision, "blocked");
assert.ok(activeTaskPrincipalLeads.violations.includes("MOST-2026-ACTIVE-TASK-PRINCIPAL-LEAD"));

const julyActiveTaskPrincipalLeads = check(
  project({ kind: 17, guide: 1, role: 1, approvalYear: 2027, endYear: 2030 }),
  [project({ kind: 17, guide: 3, role: 3, status: 3, approvalYear: 2025, endYear: 2029 })]
);
assert.equal(julyActiveTaskPrincipalLeads.decision, "blocked");
assert.ok(julyActiveTaskPrincipalLeads.violations.includes("MOST-2026-ACTIVE-TASK-PRINCIPAL-LEAD"));

const concurrentPrincipalApplications = check(
  project({ kind: 17, guide: 2, role: 1, approvalYear: 2027, endYear: 2030 }),
  [project({ kind: 18, guide: 3, role: 3, status: 0, approvalYear: 2027, endYear: 2030 })]
);
assert.equal(concurrentPrincipalApplications.decision, "blocked");
assert.ok(concurrentPrincipalApplications.violations.includes("MOST-2026-PRINCIPAL-APPLICATION-LIMIT-1"));

const thirdMostPersonnelProject = check(
  project({ kind: 17, guide: 2, role: 5, approvalYear: 2027, endYear: 2030 }),
  [
    project({ kind: 17, guide: 3, role: 5, status: 3, approvalYear: 2025, endYear: 2029 }),
    project({ kind: 18, guide: 3, role: 6, status: 3, approvalYear: 2025, endYear: 2029 })
  ]
);
assert.equal(thirdMostPersonnelProject.decision, "blocked");
assert.ok(thirdMostPersonnelProject.violations.includes("MOST-2026-PERSONNEL-TOTAL-2"));

const smallInternationalCandidate = check(
  project({ kind: 17, guide: 2, tag: 4, role: 5, centralBudget: 400,
    approvalYear: 2027, endYear: 2030 }),
  [
    project({ kind: 17, guide: 3, role: 5, status: 3, approvalYear: 2025, endYear: 2029 }),
    project({ kind: 18, guide: 3, role: 6, status: 3, approvalYear: 2025, endYear: 2029 })
  ]
);
assert.equal(smallInternationalCandidate.decision, "allowed");
assert.equal(smallInternationalCandidate.counts.mostInternal, 2);

const largeInternationalCandidate = check(
  project({ kind: 17, guide: 2, tag: 4, role: 5, centralBudget: 401,
    approvalYear: 2027, endYear: 2030 }),
  [
    project({ kind: 17, guide: 3, role: 5, status: 3, approvalYear: 2025, endYear: 2029 }),
    project({ kind: 18, guide: 3, role: 6, status: 3, approvalYear: 2025, endYear: 2029 })
  ]
);
assert.equal(largeInternationalCandidate.decision, "blocked");
assert.ok(largeInternationalCandidate.violations.includes("MOST-2026-PERSONNEL-TOTAL-2"));

const exitedDuringOriginalTerm = check(
  project({ kind: 17, guide: 1, role: 5, approvalYear: 2027, endYear: 2030 }),
  [project({ kind: 17, guide: 3, role: 5, status: 4, approvalYear: 2025, endYear: 2029 })]
);
assert.equal(exitedDuringOriginalTerm.decision, "blocked");
assert.ok(exitedDuringOriginalTerm.violations.includes("MOST-2026-WITHDRAWAL-ORIGINAL-TERM"));

const withdrawnOtherResearcher = check(
  project({ kind: 17, guide: 2, role: 5, approvalYear: 2027, endYear: 2030 }),
  [project({ kind: 17, guide: 3, role: 6, status: 4, approvalYear: 2025, endYear: 2029 })]
);
assert.equal(withdrawnOtherResearcher.decision, "allowed");
assert.equal(withdrawnOtherResearcher.counts.mostInternal, 1);

const unspecifiedGuide = check(
  project({ kind: 17, guide: 3, role: 5, approvalYear: 2027, endYear: 2030 })
);
assert.equal(unspecifiedGuide.decision, "review");
assert.deepEqual(unspecifiedGuide.reviews, ["REVIEW-MOST-GUIDE-VERSION"]);

const nsfcSpecialNeedsReview = check(project({ kind: 1 }));
assert.equal(nsfcSpecialNeedsReview.decision, "review");
assert.deepEqual(nsfcSpecialNeedsReview.reviews, ["REVIEW-NSFC-SPECIAL-RULES"]);

const invalidGuideKind = check(project({ kind: 0, guide: 2 }));
assert.equal(invalidGuideKind.ok, false);

const invalidDate = check(project({ endMonth: 2, endDay: 30 }));
assert.equal(invalidDate.ok, false);

console.log(`OCaml kernel smoke tests passed (${kernelBytes} bytes)`);
