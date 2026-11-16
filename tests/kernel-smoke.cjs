const assert = require("node:assert/strict");
const fs = require("node:fs");
const vm = require("node:vm");

const kernelPath = "web/public/kernel.js";
const kernelBytes = fs.statSync(kernelPath).size;
assert.ok(
  kernelBytes < 200_000,
  `OCaml kernel is ${kernelBytes} bytes; expected a release build below 200 KB`
);

const context = { console, TextEncoder, TextDecoder, performance, process, require };
vm.createContext(context);
vm.runInContext(fs.readFileSync(kernelPath, "utf8"), context);

const kernel = context.GrantLimitKernel;
assert.ok(kernel, "OCaml kernel should export GrantLimitKernel");

function check(candidate, existing = "", title = 0) {
  return JSON.parse(kernel.check(title, candidate, existing));
}

const empty = check("5,0,0,0,2026,0,0");
assert.equal(empty.decision, "allowed");
assert.equal(empty.counts.total, 1);

const third = check(
  "5,0,0,0,2026,0,0",
  "0,0,1,1,2025,0,0;1,0,1,1,2024,0,0"
);
assert.equal(third.decision, "blocked");
assert.deepEqual(third.violations, ["NSFC-2026-TOTAL-SENIOR-2"]);

const exactly200 = check(
  "5,0,0,0,2026,0,0",
  "10,0,1,1,2025,200,0"
);
const over200 = check(
  "5,0,0,0,2026,0,0",
  "10,0,1,1,2025,201,0"
);
assert.equal(exactly200.counts.total, 1);
assert.equal(over200.counts.total, 2);

const jointThird = check(
  "18,0,0,0,2026,0,0",
  "2,0,1,1,2025,0,0;17,0,3,1,2025,0,0"
);
assert.equal(jointThird.decision, "blocked");
assert.equal(jointThird.counts.joint, 3);
assert.deepEqual(jointThird.violations, ["JOINT-2022-107-LIMIT-2"]);

const youngScientist = check(
  "17,1,0,0,2026,0,0",
  "2,0,1,1,2025,0,0;17,0,3,1,2025,0,0"
);
assert.equal(youngScientist.decision, "allowed");
assert.equal(youngScientist.counts.joint, 2);

console.log(`OCaml kernel smoke tests passed (${kernelBytes} bytes)`);
