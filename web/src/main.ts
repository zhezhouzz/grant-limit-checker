import "./style.css";
import modelSource from "../../formal/Model.v?raw";
import rulesSource from "../../formal/Rules2026.v?raw";
import checkerSource from "../../formal/Checker.v?raw";
import soundnessSource from "../../formal/Soundness.v?raw";

type Option = { value: number; label: string; help: string };
type KindOption = Option & { agency: number };
type ProjectInput = {
  agency: number;
  kind: number;
  tag: number;
  role: number;
  status: number;
  startYear: number;
  endYear: number;
  directCost: number;
  titleAtApproval: number;
};

const agencies: Option[] = [
  { value: 0, label: "国家自然科学基金委员会", help: "国家自然科学基金项目。当前覆盖部分 2026 年通用规则及跨部门联合限项。" },
  { value: 1, label: "科学技术部 / 国家科技计划", help: "当前仅覆盖国科办资〔2022〕107 号规定的跨部门联合限项，尚不覆盖各专项指南的全部限制。" }
];

const kinds: KindOption[] = [
  { value: 0, agency: 0, label: "面上项目", help: "国家自然科学基金面上项目。纳入当前通用总数限制。" },
  { value: 1, agency: 0, label: "重点项目", help: "重点项目另有特殊规定，本版尚未完整覆盖。" },
  { value: 2, agency: 0, label: "重大项目", help: "项目负责人或课题负责人纳入国家科技计划联合限项。" },
  { value: 3, agency: 0, label: "重大研究计划项目", help: "当前只检查已经形式化的通用数量规则。" },
  { value: 4, agency: 0, label: "联合基金项目", help: "不同联合基金及同名联合基金的特殊限项尚未完整覆盖。" },
  { value: 5, agency: 0, label: "青年科学基金项目（C 类）", help: "含原青年科学基金项目。" },
  { value: 6, agency: 0, label: "青年科学基金项目（B 类）", help: "含原优秀青年科学基金项目；仍需核对项目专项规定。" },
  { value: 7, agency: 0, label: "青年科学基金项目（A 类）", help: "含原国家杰出青年科学基金项目；仍需核对项目专项规定。" },
  { value: 8, agency: 0, label: "地区科学基金项目", help: "地区资格及获资助次数限制尚未形式化。" },
  { value: 9, agency: 0, label: "重点国际（地区）合作研究项目", help: "国际合作类另有特殊限项，本版尚未完整覆盖。" },
  { value: 10, agency: 0, label: "组织间国际（地区）合作研究项目", help: "直接费用超过 200 万元且作为申请人或负责人时，纳入基金委通用总数。" },
  { value: 11, agency: 0, label: "国家重大科研仪器研制项目", help: "部门推荐项目的负责人，以及具有高级职称的主要参与者，纳入联合限项。" },
  { value: 12, agency: 0, label: "创新研究群体项目", help: "当前只检查已经形式化的通用数量规则。" },
  { value: 13, agency: 0, label: "卓越研究群体项目", help: "含原基础科学中心项目；学术带头人和骨干成员纳入联合限项。" },
  { value: 14, agency: 0, label: "原创探索计划（期限 > 1 年）", help: "申请、获资助后的不同计数时点尚未完整覆盖。" },
  { value: 15, agency: 0, label: "专项项目（期限 > 1 年）", help: "应同时核对具体专项指南。" },
  { value: 16, agency: 0, label: "明确不计总数的项目类型", help: "不进入当前基金委通用总数，但仍可能适用其他特殊规则。" },
  { value: 17, agency: 1, label: "国家重点研发计划", help: "当前检查跨部门联合限项；青年科学家、科技型中小企业和国际合作类项目不纳入该项联合计数。" },
  { value: 18, agency: 1, label: "国家科技重大专项", help: "当前检查跨部门联合限项；青年科学家项目不纳入该项联合计数。" }
];

const tags: Option[] = [
  { value: 0, label: "无特殊标识", help: "不属于下列特殊项目标识。" },
  { value: 1, label: "青年科学家项目", help: "国家重点研发计划和国家科技重大专项中的青年科学家项目，不纳入国科办资〔2022〕107 号联合限项。" },
  { value: 2, label: "科技型中小企业项目", help: "国家重点研发计划中的科技型中小企业项目不纳入该项联合限项。" },
  { value: 3, label: "国际合作类项目", help: "国家重点研发计划中的国际合作类项目不纳入该项联合限项。" },
  { value: 4, label: "部门推荐项目", help: "用于标识国家重大科研仪器研制项目中的部门推荐项目。" }
];

const roles: Option[] = [
  { value: 0, label: "申请人", help: "正在申请项目的申请人。" },
  { value: 1, label: "项目负责人", help: "项目负责人。" },
  { value: 2, label: "主要参与者", help: "申请中或在研项目的主要参与者，不包括学生。" },
  { value: 3, label: "课题负责人", help: "国家科技计划项目下设课题的负责人。" },
  { value: 4, label: "学术带头人", help: "卓越研究群体或原基础科学中心项目的学术带头人。" },
  { value: 5, label: "骨干成员", help: "卓越研究群体或原基础科学中心项目的骨干成员。" }
];

const statuses: Option[] = [
  { value: 0, label: "申请中", help: "本年度已经提交或拟同时提交的项目。" },
  { value: 1, label: "正在承担", help: "是否仍处于执行期由结束年度与本次申请年度比较得出。" },
  { value: 2, label: "初审不予受理", help: "不计入当前申请和承担项目数量。" },
  { value: 3, label: "已经结题", help: "已经完成结题，不计入当前申请和承担项目数量。" }
];

const titles: Option[] = [
  { value: 0, label: "具有高级专业技术职务（职称）", help: "当前具有高级专业技术职务（职称）。" },
  { value: 1, label: "不具有高级专业技术职务（职称）", help: "当前不具有高级专业技术职务（职称）。" }
];

const nsfcSource = "https://www.nsfc.gov.cn/u/cms/www/202601/190844586k0w.pdf";
const jointSource = "https://www.most.gov.cn/xxgk/xinxifenlei/fdzdgknr/fgzc/gfxwj/gfxwj2022/202208/t20220810_181836.html";
const most2026Source = "https://service.most.gov.cn/kjjh_tztg_all/20261110/5933.html";
const ruleText: Record<string, { title: string; body: string; source: string; href: string }> = {
  "NSFC-2026-GENERAL-1": { title: "同年同类型申请超过 1 项", body: "作为申请人，本年度同类型项目数量超过一般上限 1 项。", source: "2026 申请规定，第 7 页，二（一）1", href: nsfcSource },
  "NSFC-2026-TOTAL-SENIOR-2": { title: "高级职称人员项目总数超过 2 项", body: "计入范围的申请和正在承担项目总数超过 2 项。", source: "2026 申请规定，第 7–8 页，二（二）1", href: nsfcSource },
  "NSFC-2026-TOTAL-NONSENIOR-LEADER-1": { title: "非高级职称人员负责人项目数超过 1 项", body: "作为申请人申请和作为负责人正在承担的项目合计超过 1 项。", source: "2026 申请规定，第 7–8 页，二（二）1", href: nsfcSource },
  "NSFC-2026-TOTAL-NONSENIOR-PARTICIPANT-2": { title: "非高级职称人员参与项目数超过 2 项", body: "作为主要参与者申请和正在承担的项目合计超过 2 项。", source: "2026 申请规定，第 7–8 页，二（二）1", href: nsfcSource },
  "JOINT-2022-107-LIMIT-2": { title: "国家科技计划联合限项超过 2 项", body: "符合实施范围的申请和在研项目合计超过 2 项。", source: "国科办资〔2022〕107 号，二、三（一）", href: jointSource },
  "MOST-2026-ACTIVE-PROJECT-PRINCIPAL": { title: "在研项目负责人不得再次申报或参与", body: "你正在承担国家重点研发计划或国家科技重大专项的项目负责人任务，不能再牵头或参与申报新的项目（课题）。", source: "“十五五”重点专项 2026 年申报指南，三、2", href: most2026Source }
};

const modelFiles = [
  { id: "model", name: "Model.v", description: "项目类别、标识、角色与判定结果", source: modelSource },
  { id: "rules", name: "Rules2026.v", description: "数值谓词、基金委规则与联合限项", source: rulesSource },
  { id: "checker", name: "Checker.v", description: "可执行违规列表与最终判定", source: checkerSource },
  { id: "soundness", name: "Soundness.v", description: "可靠性定理与可计算示例", source: soundnessSource }
];

const currentYear = 2026;
const years = Array.from({ length: 27 }, (_, index) => 2036 - index);
let projects: ProjectInput[] = [];
const app = document.querySelector<HTMLDivElement>("#app");
if (!app) throw new Error("Missing app container");

app.innerHTML = `
  <header class="site-header"><div class="header-inner"><a class="brand" href="#">纵向项目限项检查器 <span class="beta">MVP</span></a><nav aria-label="主导航"><a href="#tools">使用工具</a><a href="#sources">规则来源</a><a href="https://github.com/zhezhouzz/grant-limit-checker" target="_blank" rel="noreferrer">GitHub ↗</a></nav></div></header>
  <main>
    <section class="intro"><p class="eyebrow">Formal · Executable · Open Source</p><h1>严格形式化的<br>项目限项检查器</h1>
      <div class="early-badge"><strong>早期版本 · 仅覆盖部分规则</strong><span>当前覆盖部分 2026 年基金委通用规则，以及基金委与国家科技计划的联合限项。</span></div>
      <div class="principles" role="list" aria-label="项目原则"><article class="principle unofficial" role="listitem"><span>01</span><div><strong>非官方工具</strong><p>结果仅供参考，以当年正式指南和主管部门解释为准。</p></div></article><article class="principle" role="listitem"><span>02</span><div><strong>中文规则</strong><p>检查规则（中文）形式化在 Rocq 之中，方便大家检查和阅读。</p></div></article><article class="principle" role="listitem"><span>03</span><div><strong>可执行内核</strong><p>形式化的定义直接 extract 成 OCaml 可执行程序，在网页之中运行。</p></div></article></div>
    </section>
    <section id="tools" class="view-switch" aria-label="选择工具" role="tablist"><button id="show-checker" class="view-tab active" type="button" role="tab" aria-selected="true" aria-controls="checker-view"><span>01</span>限项检查器</button><button id="show-model" class="view-tab" type="button" role="tab" aria-selected="false" aria-controls="model-view"><span>02</span>形式化模型</button></section>
    <div id="checker-view" class="view-panel" role="tabpanel" aria-labelledby="show-checker">
      <section id="checker" class="checker" aria-labelledby="checker-title"><div class="section-heading"><div><span class="step">01</span><h2 id="checker-title">个人情况</h2></div></div><div class="field-grid single">${selectField("current-title", "当前专业技术职务", titles, 0, "职称会影响部分项目数量上限。")}</div>
        <div class="section-heading subsection"><div><span class="step">02</span><h2>拟申请或拟参与项目</h2></div></div><div id="candidate" class="field-grid">${selectField("candidate-agency", "主管部门 / 计划体系", agencies, 0, "先选择主管部门，再选择对应项目类别。")}${selectField("candidate-kind", "项目类型", kindsForAgency(0), 0, "项目类型决定适用规则。")}${selectField("candidate-tag", "项目标识", tags, 0, "青年科学家等标识会影响联合限项。")}${selectField("candidate-role", "你的角色", roles, 0, "项目负责人、课题负责人等角色适用范围不同。")}${yearField("candidate-year", "申请年度", currentYear, "本次检查使用的申请年度；与项目开始年度相互独立。", true)}${yearField("candidate-start", "预计开始年度", 2027, "申请年度为 2026 时，项目可能从 2026 或 2027 年开始。")}${yearField("candidate-end", "预计结束年度", 2029, "请填写预计执行期结束年度；开始年度不能推导结束年度。", false, 2027)}${numberField("candidate-cost", "直接费用（万元）", 0, "组织间国际合作项目以超过 200 万元为计数边界。")}</div>
        <div class="section-heading subsection"><div><span class="step">03</span><h2>已有或同时申请的项目</h2></div><button id="add-project" class="button secondary" type="button">＋ 添加项目</button></div><div id="project-list" class="project-list"></div><div id="empty-state" class="empty-state">尚未添加已有项目，可以直接检查。</div><div class="actions"><button id="run-check" class="button primary" type="button">运行形式化检查 <span>⌘↵</span></button><span id="kernel-status" class="kernel-status">正在加载 OCaml 内核…</span></div>
      </section><section id="result" class="result hidden" aria-live="polite"></section>
      <section id="sources" class="sources"><div class="section-heading"><div><span class="step">04</span><h2>规则来源与覆盖范围</h2></div></div><div class="source-grid"><article><h3>国家自然科学基金</h3><p>《2026 年度国家自然科学基金项目指南——申请规定》</p><a href="${nsfcSource}" target="_blank" rel="noreferrer">查看基金委 PDF ↗</a></article><article><h3>国家科技计划联合限项</h3><p>跨部门联合限项措施，国科办资〔2022〕107 号。</p><a href="${jointSource}" target="_blank" rel="noreferrer">查看科技部文件 ↗</a></article><article><h3>发现问题？</h3><p>提交正式来源、规则纠错或匿名化反例，帮助完善形式化模型。</p><a href="https://github.com/zhezhouzz/grant-limit-checker/issues/new?template=rule-report.yml" target="_blank" rel="noreferrer">提交规则 Issue ↗</a></article></div></section>
    </div>
    <section id="model-view" class="view-panel model-view hidden" role="tabpanel" aria-labelledby="show-model"><div class="model-intro"><p class="eyebrow">Rocq source · synchronized at build time</p><h2>主要形式化模型</h2><p>以下内容直接来自本版本仓库中的 Rocq 源文件；网页构建时读取源码，不维护另一份复制文本。</p></div><div class="model-layout"><nav class="file-tabs" aria-label="形式化文件">${modelFiles.map((file, index) => `<button class="file-tab ${index === 0 ? "active" : ""}" type="button" data-file="${file.id}"><strong>${file.name}</strong><span>${file.description}</span></button>`).join("")}</nav><div class="code-panel"><div class="code-head"><div><strong id="code-name"></strong><span id="code-description"></span></div><a id="code-github" target="_blank" rel="noreferrer">在 GitHub 查看 ↗</a></div><pre tabindex="0"><code id="model-code"></code></pre></div></div></section>
  </main><footer><p>非官方 · 中文规则 · Rocq → OCaml</p><a href="https://github.com/zhezhouzz/grant-limit-checker/blob/main/LICENSE">MIT License</a></footer>`;

function info(help: string, id?: string): string { return `<span class="info" tabindex="0" aria-label="说明：${help}">i<span class="tooltip" ${id ? `id="${id}"` : ""} role="tooltip">${help}</span></span>`; }
function kindsForAgency(agency: number): KindOption[] { return kinds.filter((item) => item.agency === agency); }
function options(values: Option[], selected: number): string { return values.map((item) => `<option value="${item.value}" ${item.value === selected ? "selected" : ""}>${item.label}</option>`).join(""); }
function selectField(id: string, label: string, values: Option[], selected: number, help: string): string { const selectedHelp = values.find((item) => item.value === selected)?.help ?? help; return `<label class="field"><span>${label} ${info(selectedHelp, `${id}-help`)}</span><select id="${id}" aria-describedby="${id}-help">${options(values, selected)}</select></label>`; }
function yearField(id: string, label: string, selected: number, help: string, fixed = false, minimum = 0): string { const availableYears = fixed ? [2026] : years.filter((year) => year >= minimum); return `<label class="field"><span>${label} ${info(help)}</span><select id="${id}">${availableYears.map((year) => `<option value="${year}" ${year === selected ? "selected" : ""}>${year} 年</option>`).join("")}</select></label>`; }
function numberField(id: string, label: string, value: number, help: string): string { return `<label class="field"><span>${label} ${info(help, `${id}-help`)}</span><input id="${id}" type="number" inputmode="numeric" min="0" max="100000" step="1" value="${value}" aria-describedby="${id}-help"></label>`; }
function updateHelp(select: HTMLSelectElement, values: Option[]): void {
  const help = document.querySelector<HTMLElement>(`#${select.id}-help`);
  const text = values.find((item) => item.value === Number(select.value))?.help ?? "";
  if (help) {
    help.textContent = text;
    help.parentElement?.setAttribute("aria-label", `说明：${text}`);
  }
}
function bindHelp(id: string, values: Option[]): void { const select = document.querySelector<HTMLSelectElement>(`#${id}`); select?.addEventListener("change", () => updateHelp(select, values)); }
function selectNumber(id: string, fallback: number): number { const value = Number(document.querySelector<HTMLInputElement | HTMLSelectElement>(`#${id}`)?.value ?? fallback); return Number.isFinite(value) && value >= 0 ? Math.trunc(value) : fallback; }

function projectCard(project: ProjectInput, index: number): string {
  return `<article class="project-card" data-index="${index}"><div class="project-card-header"><h3>项目 ${index + 1}</h3><button class="remove-project" data-index="${index}" type="button" aria-label="删除项目 ${index + 1}">删除</button></div><div class="field-grid project-fields">${selectField(`agency-${index}`, "主管部门 / 计划体系", agencies, project.agency, "先选择主管部门。")}${selectField(`kind-${index}`, "项目类型", kindsForAgency(project.agency), project.kind, "请选择对应计划体系中的项目类别。")}${selectField(`tag-${index}`, "项目标识", tags, project.tag, "青年科学家等标识影响联合限项。")}${selectField(`role-${index}`, "你的角色", roles, project.role, "选择你在该项目中的身份。")}${selectField(`status-${index}`, "项目状态", statuses, project.status, "状态描述行政事实；是否在申请年度计数由结束年度计算。")}${yearField(`start-${index}`, "批准 / 开始年度", project.startYear, "批准或开始年度用于 2020、2023 等计数分界。")}${yearField(`end-${index}`, "执行期结束年度", project.endYear, "填写包括获批延期后的执行期结束年度。申请当年期满由内核自动判断。", false, project.startYear)}${numberField(`cost-${index}`, "直接费用（万元）", project.directCost, "组织间国际合作项目以超过 200 万元为边界。")}${selectField(`title-${index}`, "批准时职称", titles, project.titleAtApproval, "用于处理晋升高级职称后的参与项目例外。")}</div></article>`;
}

function renderProjects(): void {
  const list = document.querySelector<HTMLDivElement>("#project-list"); const empty = document.querySelector<HTMLDivElement>("#empty-state"); if (!list || !empty) return;
  list.innerHTML = projects.map(projectCard).join(""); empty.classList.toggle("hidden", projects.length > 0);
  projects.forEach((_, index) => {
    bindHelp(`agency-${index}`, agencies); bindHelp(`kind-${index}`, kinds); bindHelp(`tag-${index}`, tags); bindHelp(`role-${index}`, roles); bindHelp(`status-${index}`, statuses); bindHelp(`title-${index}`, titles);
    document.querySelector<HTMLSelectElement>(`#agency-${index}`)?.addEventListener("change", (event) => { collectProjects(); const agency = Number((event.currentTarget as HTMLSelectElement).value); projects[index].agency = agency; projects[index].kind = kindsForAgency(agency)[0].value; renderProjects(); });
    document.querySelector<HTMLSelectElement>(`#start-${index}`)?.addEventListener("change", () => { collectProjects(); projects[index].endYear = Math.max(projects[index].startYear, projects[index].endYear); renderProjects(); });
  });
  list.querySelectorAll<HTMLButtonElement>(".remove-project").forEach((button) => button.addEventListener("click", () => { collectProjects(); projects.splice(Number(button.dataset.index), 1); renderProjects(); }));
}

function collectProjects(): void { projects = projects.map((project, index) => ({ agency: selectNumber(`agency-${index}`, project.agency), kind: selectNumber(`kind-${index}`, project.kind), tag: selectNumber(`tag-${index}`, project.tag), role: selectNumber(`role-${index}`, project.role), status: selectNumber(`status-${index}`, project.status), startYear: selectNumber(`start-${index}`, project.startYear), endYear: selectNumber(`end-${index}`, project.endYear), directCost: selectNumber(`cost-${index}`, project.directCost), titleAtApproval: selectNumber(`title-${index}`, project.titleAtApproval) })); }
function encode(project: ProjectInput): string { return [project.kind, project.tag, project.role, project.status, project.startYear, project.endYear, project.directCost, project.titleAtApproval].join(","); }

function runCheck(): void {
  collectProjects(); const title = selectNumber("current-title", 0);
  const applicationYear = selectNumber("candidate-year", currentYear);
  const candidate: ProjectInput = { agency: selectNumber("candidate-agency", 0), kind: selectNumber("candidate-kind", 0), tag: selectNumber("candidate-tag", 0), role: selectNumber("candidate-role", 0), status: 0, startYear: selectNumber("candidate-start", 2027), endYear: selectNumber("candidate-end", 2029), directCost: selectNumber("candidate-cost", 0), titleAtApproval: title };
  const resultElement = document.querySelector<HTMLElement>("#result"); if (!resultElement) return;
  if (!window.GrantLimitKernel) { resultElement.classList.remove("hidden"); resultElement.innerHTML = `<div class="verdict invalid"><span>!</span><div><p>内核未加载</p><h2>无法运行检查</h2></div></div>`; return; }
  const result = JSON.parse(window.GrantLimitKernel.check(title, applicationYear, encode(candidate), projects.map(encode).join(";"))) as KernelResult; renderResult(result, title);
}

function renderResult(result: KernelResult, title: number): void {
  const element = document.querySelector<HTMLElement>("#result"); if (!element) return; element.classList.remove("hidden");
  if (!result.ok) { element.innerHTML = `<div class="verdict invalid"><span>!</span><div><p>规范化输入错误</p><h2>内核拒绝了无效输入</h2></div></div>`; return; }
  const allowed = result.decision === "allowed";
  const nsfcCount = title === 0 ? `基金委通用总数：<strong>${result.counts.total}</strong> / 2` : `负责人：<strong>${result.counts.leader}</strong> / 1　参与者：<strong>${result.counts.participant}</strong> / 2`;
  const diagnostics = allowed ? `<div class="diagnostic pass"><code>CHECK-PASSED</code><div><h3>已实现规则未发现冲突</h3><p>候选项目通过当前形式化规则集，仍需核对尚未覆盖的专项规定。</p></div></div>` : result.violations.map((code) => { const rule = ruleText[code]; return `<div class="diagnostic fail"><code>${code}</code><div><h3>${rule?.title ?? "触发限项规则"}</h3><p>${rule?.body ?? "请查阅对应规则。"}</p><a href="${rule?.href ?? nsfcSource}" target="_blank" rel="noreferrer">${rule?.source ?? "查看来源"} ↗</a></div></div>`; }).join("");
  element.innerHTML = `<div class="result-head"><div class="verdict ${allowed ? "allowed" : "blocked"}"><span>${allowed ? "✓" : "×"}</span><div><p>Rocq → OCaml 判定</p><h2>${allowed ? "当前规则下未发现限项" : "发现限项冲突"}</h2></div></div><div class="count-summary">${nsfcCount}<small>联合限项计数：${result.counts.joint} / 2 · 同类型申请：${result.counts.sameType}</small></div></div><div class="diagnostics"><h3 class="diagnostics-title">诊断信息</h3>${diagnostics}</div><div class="coverage-warning">早期版本：当前仅覆盖部分 2026 年基金委通用规则与国家科技计划联合限项，结果不是主管部门或依托单位的官方意见。</div>`; element.scrollIntoView({ behavior: "smooth", block: "start" });
}

function showView(view: "checker" | "model"): void {
  const checker = document.querySelector<HTMLElement>("#checker-view"); const model = document.querySelector<HTMLElement>("#model-view"); const checkerButton = document.querySelector<HTMLButtonElement>("#show-checker"); const modelButton = document.querySelector<HTMLButtonElement>("#show-model"); const checkerActive = view === "checker";
  checker?.classList.toggle("hidden", !checkerActive); model?.classList.toggle("hidden", checkerActive); checkerButton?.classList.toggle("active", checkerActive); modelButton?.classList.toggle("active", !checkerActive); checkerButton?.setAttribute("aria-selected", String(checkerActive)); modelButton?.setAttribute("aria-selected", String(!checkerActive));
}

function showModelFile(id: string): void {
  const file = modelFiles.find((item) => item.id === id) ?? modelFiles[0]; const code = document.querySelector<HTMLElement>("#model-code"); const name = document.querySelector<HTMLElement>("#code-name"); const description = document.querySelector<HTMLElement>("#code-description"); const github = document.querySelector<HTMLAnchorElement>("#code-github");
  if (code) code.textContent = file.source; if (name) name.textContent = file.name; if (description) description.textContent = file.description; if (github) github.href = `https://github.com/zhezhouzz/grant-limit-checker/blob/main/formal/${file.name}`;
  document.querySelectorAll<HTMLButtonElement>(".file-tab").forEach((button) => button.classList.toggle("active", button.dataset.file === file.id));
}

document.querySelector<HTMLButtonElement>("#add-project")?.addEventListener("click", () => { collectProjects(); projects.push({ agency: 0, kind: 0, tag: 0, role: 1, status: 1, startYear: 2025, endYear: 2028, directCost: 0, titleAtApproval: selectNumber("current-title", 0) }); renderProjects(); });
document.querySelector<HTMLButtonElement>("#run-check")?.addEventListener("click", runCheck);
document.querySelector<HTMLButtonElement>("#show-checker")?.addEventListener("click", () => showView("checker")); document.querySelector<HTMLButtonElement>("#show-model")?.addEventListener("click", () => showView("model"));
document.querySelectorAll<HTMLButtonElement>(".file-tab").forEach((button) => button.addEventListener("click", () => showModelFile(button.dataset.file ?? "model")));
document.querySelector<HTMLSelectElement>("#candidate-agency")?.addEventListener("change", (event) => { const agency = Number((event.currentTarget as HTMLSelectElement).value); const select = document.querySelector<HTMLSelectElement>("#candidate-kind"); if (select) { const available = kindsForAgency(agency); select.innerHTML = options(available, available[0].value); updateHelp(select, available); } });
document.querySelector<HTMLSelectElement>("#candidate-start")?.addEventListener("change", (event) => { const start = Number((event.currentTarget as HTMLSelectElement).value); const end = document.querySelector<HTMLSelectElement>("#candidate-end"); if (end) { const selected = Math.max(start, Number(end.value)); end.innerHTML = years.filter((year) => year >= start).map((year) => `<option value="${year}" ${year === selected ? "selected" : ""}>${year} 年</option>`).join(""); } });
document.addEventListener("keydown", (event) => { if ((event.metaKey || event.ctrlKey) && event.key === "Enter") runCheck(); });
bindHelp("candidate-agency", agencies); bindHelp("candidate-kind", kinds); bindHelp("candidate-tag", tags); bindHelp("candidate-role", roles); bindHelp("current-title", titles); renderProjects(); showModelFile("model");
const kernelStatus = document.querySelector<HTMLElement>("#kernel-status"); if (kernelStatus) { kernelStatus.textContent = window.GrantLimitKernel ? "● OCaml 内核已加载" : "○ OCaml 内核加载失败"; kernelStatus.classList.toggle("ready", Boolean(window.GrantLimitKernel)); }
