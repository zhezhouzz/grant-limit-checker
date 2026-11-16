import "./style.css";

type Option = { value: number; label: string; help: string };
type ProjectInput = {
  kind: number;
  role: number;
  status: number;
  year: number;
  directCost: number;
  titleAtApproval: number;
};

const kinds: Option[] = [
  { value: 0, label: "面上项目", help: "国家自然科学基金面上项目。纳入本 MVP 的总数限制。" },
  { value: 1, label: "重点项目", help: "重点项目另有负责人限 1 项等特殊规定，本版尚未完整覆盖。" },
  { value: 2, label: "重大项目", help: "重大项目；课题负责人等角色的细分规则尚待加入。" },
  { value: 3, label: "重大研究计划项目", help: "当前表示非集成、非战略研究项目；特殊亚类尚待细分。" },
  { value: 4, label: "联合基金项目", help: "不同联合基金及同名联合基金还有特殊限项，本版尚未完整覆盖。" },
  { value: 5, label: "青年科学基金项目（C 类）", help: "含原青年科学基金项目。" },
  { value: 6, label: "青年科学基金项目（B 类）", help: "含原优秀青年科学基金项目；申请阶段计数时点有特殊规定。" },
  { value: 7, label: "青年科学基金项目（A 类）", help: "含原国家杰出青年科学基金项目；申请阶段计数时点有特殊规定。" },
  { value: 8, label: "地区科学基金项目", help: "另有地区资格及获资助次数限制，本版只检查通用数量。" },
  { value: 9, label: "重点国际（地区）合作研究项目", help: "国际合作类另有负责人限项，本版尚未完整覆盖。" },
  { value: 10, label: "组织间国际（地区）合作研究项目", help: "是否计入由具体直接费用和角色共同判断：超过 200 万元且作为申请人/负责人时计入。" },
  { value: 11, label: "国家重大科研仪器研制项目", help: "有多项特殊限制，本版只检查通用数量。" },
  { value: 12, label: "创新研究群体项目", help: "2024 年及以前批准项目等例外尚待精细建模。" },
  { value: 13, label: "卓越研究群体项目", help: "含原基础科学中心项目；特殊角色限制尚待加入。" },
  { value: 14, label: "原创探索计划（期限 > 1 年）", help: "申请阶段不计总数、获资助后计入等时点规则尚待完整覆盖。" },
  { value: 15, label: "专项项目（期限 > 1 年）", help: "不含另有说明及科技活动项目；应对照具体指南。" },
  { value: 16, label: "明确不计总数的项目类型", help: "如数学天元、国际合作交流或期限不超过 1 年的特定项目。仍可能适用其他特殊规则。" }
];

const roles: Option[] = [
  { value: 0, label: "申请人", help: "正在申请项目的申请人。" },
  { value: 1, label: "项目负责人", help: "已获资助项目的负责人。" },
  { value: 2, label: "主要参与者", help: "申请中或在研项目的主要参与者，不包括学生。" }
];

const statuses: Option[] = [
  { value: 0, label: "申请中", help: "本年度已提交或拟同时提交的项目。" },
  { value: 1, label: "正在承担", help: "资助期覆盖申请年度，且不在申请当年期满。" },
  { value: 2, label: "申请当年期满", help: "除特别说明外，不计入申请和承担项目总数。" },
  { value: 3, label: "初审不予受理", help: "不计入申请和承担项目总数。" },
  { value: 4, label: "已经结题", help: "不计入当前申请和承担项目总数；获资助次数限制可能仍适用。" }
];

const titles: Option[] = [
  { value: 0, label: "具有高级专业技术职务（职称）", help: "当前具有高级专业技术职务（职称）。" },
  { value: 1, label: "不具有高级专业技术职务（职称）", help: "当前不具有高级专业技术职务（职称）。" }
];

const ruleText: Record<string, { title: string; body: string; source: string }> = {
  "NSFC-2026-GENERAL-1": {
    title: "同年同类型申请超过 1 项",
    body: "作为申请人，本年度同类型项目数量超过一般上限 1 项。",
    source: "2026 申请规定，第 7 页，二（一）1"
  },
  "NSFC-2026-TOTAL-SENIOR-2": {
    title: "高级职称人员项目总数超过 2 项",
    body: "计入范围的申请和正在承担项目总数超过 2 项。",
    source: "2026 申请规定，第 7–8 页，二（二）1"
  },
  "NSFC-2026-TOTAL-NONSENIOR-LEADER-1": {
    title: "非高级职称人员负责人项目数超过 1 项",
    body: "作为申请人申请和作为负责人正在承担的项目合计超过 1 项。",
    source: "2026 申请规定，第 7–8 页，二（二）1"
  },
  "NSFC-2026-TOTAL-NONSENIOR-PARTICIPANT-2": {
    title: "非高级职称人员参与项目数超过 2 项",
    body: "作为主要参与者申请和正在承担的项目合计超过 2 项。",
    source: "2026 申请规定，第 7–8 页，二（二）1"
  }
};

const currentYear = 2026;
const years = Array.from({ length: 17 }, (_, index) => currentYear - index);
let projects: ProjectInput[] = [];

const app = document.querySelector<HTMLDivElement>("#app");
if (!app) throw new Error("Missing app container");

app.innerHTML = `
  <header class="site-header">
    <div class="header-inner">
      <a class="brand" href="#">纵向项目限项检查器 <span class="beta">MVP</span></a>
      <nav aria-label="主导航">
        <a href="#checker">检查器</a>
        <a href="#sources">规则来源</a>
        <a href="https://github.com/zhezhouzz/grant-limit-checker" target="_blank" rel="noreferrer">GitHub ↗</a>
      </nav>
    </div>
  </header>
  <main>
    <section class="intro">
      <p class="eyebrow">Rocq formalization · OCaml kernel</p>
      <h1>像做类型检查一样<br>检查项目限项</h1>
      <p class="lede">选择你正在参与和拟参与的项目。形式化内核返回结论、计数过程、触发规则和正式来源。</p>
      <div class="notice" role="note"><strong>非官方工具。</strong> 当前仅部分覆盖 2026 年国家自然科学基金通用规则，结果仅供参考，请以当年正式指南和依托单位解释为准。</div>
    </section>

    <section id="checker" class="checker" aria-labelledby="checker-title">
      <div class="section-heading">
        <div><span class="step">01</span><h2 id="checker-title">个人情况</h2></div>
        <p>类别使用受控选项；年份和金额作为经过范围校验的数值 feature 进入内核。</p>
      </div>
      <div class="field-grid single">
        <label class="field"><span>当前专业技术职务 ${info("职称会影响总数限制及主要参与者项目的计数起点。")}</span><select id="current-title">${options(titles, 0)}</select></label>
      </div>

      <div class="section-heading subsection">
        <div><span class="step">02</span><h2>拟申请或拟参与项目</h2></div>
        <p>这是本次需要检查的候选项目。</p>
      </div>
      <div id="candidate" class="field-grid">
        ${selectField("candidate-kind", "项目类型", kinds, 0, "不同项目类型可能适用通用限项和额外特殊规则。")}
        ${selectField("candidate-role", "你的角色", roles, 0, "申请人和主要参与者可能适用不同上限。")}
        ${yearField("candidate-year", "申请年度", currentYear, "规则按申请年度版本化；当前 MVP 固定使用 2026 规则。", true)}
        ${numberField("candidate-cost", "直接费用（万元）", 0, "用于组织间国际（地区）合作研究项目的 200 万元计数边界。")}
      </div>

      <div class="section-heading subsection">
        <div><span class="step">03</span><h2>已有或同时申请的项目</h2></div>
        <button id="add-project" class="button secondary" type="button">＋ 添加项目</button>
      </div>
      <div id="project-list" class="project-list"></div>
      <div id="empty-state" class="empty-state">还没有添加项目。若你目前没有相关项目，可以直接检查。</div>

      <div class="actions">
        <button id="run-check" class="button primary" type="button">运行形式化检查 <span>⌘↵</span></button>
        <span id="kernel-status" class="kernel-status">正在加载 OCaml 内核…</span>
      </div>
    </section>

    <section id="result" class="result hidden" aria-live="polite"></section>

    <section id="sources" class="sources">
      <div class="section-heading">
        <div><span class="step">04</span><h2>规则来源与覆盖范围</h2></div>
      </div>
      <div class="source-grid">
        <article><h3>官方来源</h3><p>《2026 年度国家自然科学基金项目指南——申请规定》</p><a href="https://www.nsfc.gov.cn/u/cms/www/202601/190844586k0w.pdf" target="_blank" rel="noreferrer">查看基金委 PDF ↗</a></article>
        <article><h3>形式化范围</h3><p>当前证明和抽取覆盖一般同类型限制、职称总数限制及部分计数边界。</p><a href="https://github.com/zhezhouzz/grant-limit-checker/blob/main/docs/sources/nsfc-2026.md" target="_blank" rel="noreferrer">查看规则映射 ↗</a></article>
        <article><h3>发现问题？</h3><p>请附官方来源、条款位置和匿名化反例，帮助社区完善定义。</p><a href="https://github.com/zhezhouzz/grant-limit-checker/issues/new?template=rule-report.yml" target="_blank" rel="noreferrer">提交规则 Issue ↗</a></article>
      </div>
    </section>
  </main>
  <footer><p>非官方、开源、可审查。判定内核由 Rocq 抽取到 OCaml。</p><a href="https://github.com/zhezhouzz/grant-limit-checker/blob/main/LICENSE">MIT License</a></footer>
`;

function info(help: string): string {
  return `<span class="info" tabindex="0" aria-label="说明：${help}">i<span class="tooltip" role="tooltip">${help}</span></span>`;
}

function options(values: Option[], selected: number): string {
  return values.map((item) => `<option value="${item.value}" ${item.value === selected ? "selected" : ""}>${item.label}</option>`).join("");
}

function selectField(id: string, label: string, values: Option[], selected: number, help: string): string {
  return `<label class="field"><span>${label} ${info(help)}</span><select id="${id}">${options(values, selected)}</select><small id="${id}-help">${values.find((item) => item.value === selected)?.help ?? ""}</small></label>`;
}

function yearField(id: string, label: string, selected: number, help: string, fixed = false): string {
  const availableYears = fixed ? [2026] : years;
  return `<label class="field"><span>${label} ${info(help)}</span><select id="${id}">${availableYears.map((year) => `<option value="${year}" ${year === selected ? "selected" : ""}>${year} 年</option>`).join("")}</select></label>`;
}

function numberField(id: string, label: string, value: number, help: string): string {
  return `<label class="field"><span>${label} ${info(help)}</span><input id="${id}" type="number" inputmode="numeric" min="0" max="100000" step="1" value="${value}" aria-describedby="${id}-help"><small id="${id}-help">请输入非负整数；非金额相关项目保持 0 即可。</small></label>`;
}

function updateHelp(select: HTMLSelectElement, values: Option[]): void {
  const help = document.querySelector<HTMLElement>(`#${select.id}-help`);
  if (help) help.textContent = values.find((item) => item.value === Number(select.value))?.help ?? "";
}

function projectCard(project: ProjectInput, index: number): string {
  return `<article class="project-card" data-index="${index}">
    <div class="project-card-header"><h3>项目 ${index + 1}</h3><button class="remove-project" data-index="${index}" type="button" aria-label="删除项目 ${index + 1}">删除</button></div>
    <div class="field-grid project-fields">
      ${selectField(`kind-${index}`, "项目类型", kinds, project.kind, "请选择正式指南中的资助类别。")}
      ${selectField(`role-${index}`, "你的角色", roles, project.role, "选择你在该项目中的身份。")}
      ${selectField(`status-${index}`, "项目状态", statuses, project.status, "状态决定项目是否进入当前计数。")}
      ${yearField(`year-${index}`, "批准/申请年度", project.year, "主要参与者项目在 2020 和 2023 年有计数分界。")}
      ${numberField(`cost-${index}`, "直接费用（万元）", project.directCost, "金额作为具体数值进入内核，再由“超过 200 万元”谓词判断。")}
      ${selectField(`title-${index}`, "当时职称", titles, project.titleAtApproval, "用于处理晋升高级职称后，原参与项目不计入的例外。")}
    </div>
  </article>`;
}

function renderProjects(): void {
  const list = document.querySelector<HTMLDivElement>("#project-list");
  const empty = document.querySelector<HTMLDivElement>("#empty-state");
  if (!list || !empty) return;
  list.innerHTML = projects.map(projectCard).join("");
  empty.classList.toggle("hidden", projects.length > 0);
  projects.forEach((_, index) => {
    bindHelp(`kind-${index}`, kinds);
    bindHelp(`role-${index}`, roles);
    bindHelp(`status-${index}`, statuses);
    bindHelp(`title-${index}`, titles);
  });
  list.querySelectorAll<HTMLButtonElement>(".remove-project").forEach((button) => {
    button.addEventListener("click", () => {
      collectProjects();
      projects.splice(Number(button.dataset.index), 1);
      renderProjects();
    });
  });
}

function bindHelp(id: string, values: Option[]): void {
  const select = document.querySelector<HTMLSelectElement>(`#${id}`);
  select?.addEventListener("change", () => updateHelp(select, values));
}

function collectProjects(): void {
  projects = projects.map((project, index) => ({
    kind: selectNumber(`kind-${index}`, project.kind),
    role: selectNumber(`role-${index}`, project.role),
    status: selectNumber(`status-${index}`, project.status),
    year: selectNumber(`year-${index}`, project.year),
    directCost: selectNumber(`cost-${index}`, project.directCost),
    titleAtApproval: selectNumber(`title-${index}`, project.titleAtApproval)
  }));
}

function selectNumber(id: string, fallback: number): number {
  const value = Number(document.querySelector<HTMLInputElement | HTMLSelectElement>(`#${id}`)?.value ?? fallback);
  return Number.isFinite(value) && value >= 0 ? Math.trunc(value) : fallback;
}

function encode(project: ProjectInput): string {
  return [project.kind, project.role, project.status, project.year, project.directCost, project.titleAtApproval].join(",");
}

function runCheck(): void {
  collectProjects();
  const title = selectNumber("current-title", 0);
  const candidate: ProjectInput = {
    kind: selectNumber("candidate-kind", 0),
    role: selectNumber("candidate-role", 0),
    status: 0,
    year: 2026,
    directCost: selectNumber("candidate-cost", 0),
    titleAtApproval: title
  };
  const resultElement = document.querySelector<HTMLElement>("#result");
  if (!resultElement) return;
  if (!window.GrantLimitKernel) {
    resultElement.classList.remove("hidden");
    resultElement.innerHTML = `<div class="verdict invalid"><span>!</span><div><p>内核未加载</p><h2>无法运行检查</h2></div></div>`;
    return;
  }
  const result = JSON.parse(window.GrantLimitKernel.check(title, encode(candidate), projects.map(encode).join(";"))) as KernelResult;
  renderResult(result, title);
}

function renderResult(result: KernelResult, title: number): void {
  const element = document.querySelector<HTMLElement>("#result");
  if (!element) return;
  element.classList.remove("hidden");
  if (!result.ok) {
    element.innerHTML = `<div class="verdict invalid"><span>!</span><div><p>规范化输入错误</p><h2>内核拒绝了无效输入</h2></div></div>`;
    return;
  }
  const allowed = result.decision === "allowed";
  const countSummary = title === 0
    ? `纳入总数：<strong>${result.counts.total}</strong> / 2`
    : `申请人/负责人：<strong>${result.counts.leader}</strong> / 1　主要参与者：<strong>${result.counts.participant}</strong> / 2`;
  const diagnostics = allowed
    ? `<div class="diagnostic pass"><code>CHECK-PASSED</code><div><h3>已实现规则未发现冲突</h3><p>候选项目通过当前形式化规则集。仍需检查尚未覆盖的项目特殊规定。</p></div></div>`
    : result.violations.map((code) => {
        const rule = ruleText[code];
        return `<div class="diagnostic fail"><code>${code}</code><div><h3>${rule?.title ?? "触发限项规则"}</h3><p>${rule?.body ?? "请查阅对应规则。"}</p><a href="https://www.nsfc.gov.cn/u/cms/www/202601/190844586k0w.pdf" target="_blank" rel="noreferrer">${rule?.source ?? "查看来源"} ↗</a></div></div>`;
      }).join("");
  element.innerHTML = `
    <div class="result-head">
      <div class="verdict ${allowed ? "allowed" : "blocked"}"><span>${allowed ? "✓" : "×"}</span><div><p>Rocq → OCaml 判定</p><h2>${allowed ? "当前规则下未发现限项" : "发现限项冲突"}</h2></div></div>
      <div class="count-summary">${countSummary}<small>同类型申请计数：${result.counts.sameType}</small></div>
    </div>
    <div class="diagnostics"><h3 class="diagnostics-title">诊断信息</h3>${diagnostics}</div>
    <div class="coverage-warning"><strong>覆盖范围提示：</strong> 当前为早期 MVP，只实现部分 2026 年通用规则。重点项目、联合基金、国际合作、重大仪器、群体及人才项目等仍有未覆盖的特殊限制。</div>`;
  element.scrollIntoView({ behavior: "smooth", block: "start" });
}

document.querySelector<HTMLButtonElement>("#add-project")?.addEventListener("click", () => {
  collectProjects();
  projects.push({ kind: 0, role: 1, status: 1, year: 2025, directCost: 0, titleAtApproval: selectNumber("current-title", 0) });
  renderProjects();
});
document.querySelector<HTMLButtonElement>("#run-check")?.addEventListener("click", runCheck);
document.addEventListener("keydown", (event) => {
  if ((event.metaKey || event.ctrlKey) && event.key === "Enter") runCheck();
});
bindHelp("candidate-kind", kinds);
bindHelp("candidate-role", roles);
renderProjects();

const kernelStatus = document.querySelector<HTMLElement>("#kernel-status");
if (kernelStatus) {
  kernelStatus.textContent = window.GrantLimitKernel ? "● OCaml 内核已加载" : "○ OCaml 内核加载失败";
  kernelStatus.classList.toggle("ready", Boolean(window.GrantLimitKernel));
}
