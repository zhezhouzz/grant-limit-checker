import "./style.css";
import modelSource from "../../formal/Model.v?raw";
import rulesSource from "../../formal/Rules2026.v?raw";
import checkerSource from "../../formal/Checker.v?raw";
import soundnessSource from "../../formal/Soundness.v?raw";

type Option = { value: number; label: string; help: string };
type KindOption = Option & { agency: number };
type GuideOption = Option & { agency: number };
type ProjectInput = {
  agency: number;
  kind: number;
  guide: number;
  tag: number;
  role: number;
  status: number;
  startYear: number;
  endYear: number;
  endMonth: number;
  endDay: number;
  directCost: number;
  centralBudget: number;
  titleAtApproval: number;
};
type KernelResult = {
  ok: boolean;
  decision: "allowed" | "blocked" | "review" | "invalid";
  counts: { sameType: number; total: number; leader: number; participant: number; joint: number; mostInternal: number; instrumentJoint: number };
  violations: string[];
  reviews: string[];
};

const agencies: Option[] = [
  { value: 0, label: "国家自然科学基金委员会", help: "适用《2026年度国家自然科学基金项目指南——申请规定》。" },
  { value: 1, label: "科学技术部 / 国家科技计划", help: "请选择本次申报对应的重点专项指南。" }
];

const guides: GuideOption[] = [
  { value: 0, agency: 0, label: "基金委2026申请规定", help: "2026年度国家自然科学基金项目指南的申请规定。" },
  { value: 3, agency: 1, label: "暂不确定具体指南", help: "如果暂时不清楚指南版本，可先选择此项，检查器会列出需要继续核对的内容。" },
  { value: 1, agency: 1, label: "2026 · 发育编程/合成生物学", help: "基金委主责的两个国家重点研发计划重点专项2026年度指南。" },
  { value: 2, agency: 1, label: "2026 · 数学/物理/催化/AI五专项", help: "2026年11月发布的五个“十五五”国家重点研发计划重点专项指南。" }
];

const kinds: KindOption[] = [
  { value: 0, agency: 0, label: "面上项目", help: "适用项目总数、同类型申请和上年度获资助等限项规定。" },
  { value: 1, agency: 0, label: "重点项目", help: "作为申请人申请和作为负责人承担的重点项目，合计一般限1项。" },
  { value: 2, agency: 0, label: "重大项目", help: "纳入基金委通用总数和国家科技计划联合限项。" },
  { value: 3, agency: 0, label: "重大研究计划项目", help: "集成项目、战略研究项目等亚类适用的限项规定有所不同。" },
  { value: 4, agency: 0, label: "联合基金项目", help: "同一名称的联合基金视为同类型项目。" },
  { value: 5, agency: 0, label: "青年科学基金项目（C类）", help: "同类型项目作为负责人原则上只能获得1次资助。" },
  { value: 6, agency: 0, label: "青年科学基金项目（B类）", help: "申请时不计入通用总数，正式受理后开始计入。" },
  { value: 7, agency: 0, label: "青年科学基金项目（A类）", help: "申请时不计入通用总数，正式受理后开始计入；延续资助另有规定。" },
  { value: 8, agency: 0, label: "地区科学基金项目", help: "自2016年起，作为负责人获资助累计不超过3次。" },
  { value: 9, agency: 0, label: "重点国际（地区）合作研究项目", help: "作为申请人申请和作为负责人承担的国际合作研究项目，合计限1项。" },
  { value: 10, agency: 0, label: "组织间国际（地区）合作研究项目", help: "直接费用超过200万元且作为申请人或负责人时纳入通用总数。" },
  { value: 11, agency: 0, label: "国家重大科研仪器研制项目", help: "与国家重点研发计划中的科学仪器方向合计限1项。" },
  { value: 12, agency: 0, label: "创新研究群体项目", help: "申请时不计入通用总数，正式受理后开始计入；2024年及以前批准的项目不计入。" },
  { value: 13, agency: 0, label: "卓越研究群体项目", help: "申请时不计入通用总数，正式受理后开始计入；与其他群体项目有交叉限项。" },
  { value: 14, agency: 0, label: "原创探索计划（期限>1年）", help: "申请时不计入通用总数，获资助后开始计入。" },
  { value: 15, agency: 0, label: "专项项目（期限>1年）", help: "具体限项办法请同时参照该专项的申请说明。" },
  { value: 16, agency: 0, label: "指南明确不计总数的类型", help: "这类项目不计入基金委通用申请和承担项目总数。" },
  { value: 17, agency: 1, label: "国家重点研发计划", help: "具体限项口径以本次申报的重点专项指南为准。" },
  { value: 18, agency: 1, label: "国家科技重大专项", help: "包括指南明确纳入的科技创新2030、接续项目、面向2035项目等。" },
  { value: 19, agency: 1, label: "中科院抢占科技制高点攻坚专项", help: "在2026年11月五专项指南中纳入内部总数限项。" },
  { value: 20, agency: 1, label: "国家实验室专项", help: "在2026年11月五专项指南中纳入内部总数限项。" }
];

const tags: Option[] = [
  { value: 0, label: "无特殊标识", help: "项目不属于下列青年科学家、国际合作或科学仪器类别。" },
  { value: 1, label: "青年科学家项目", help: "不纳入国科办资〔2022〕107号联合限项；专项本身的限项规定照常适用。" },
  { value: 2, label: "科技型中小企业项目", help: "不纳入国家重点研发计划跨部门联合限项。" },
  { value: 3, label: "其他国际合作类项目", help: "不纳入国家重点研发计划跨部门联合限项。" },
  { value: 4, label: "政府间国际科技创新合作", help: "中央财政预算不超过400万元时，部分2026专项指南不计内部2项总数。" },
  { value: 5, label: "战略性港澳台科技创新合作", help: "中央财政预算不超过400万元时，部分2026专项指南不计内部2项总数。" },
  { value: 6, label: "部门推荐", help: "用于国家重大科研仪器研制项目的部门推荐类别。" },
  { value: 7, label: "科学仪器方向", help: "国家重点研发计划中与重大科研仪器项目联合限1项的科学仪器方向。" }
];

const roles: Option[] = [
  { value: 0, label: "申请人", help: "基金委项目申请人。" },
  { value: 1, label: "项目负责人", help: "已获资助项目或科技计划项目的项目负责人。" },
  { value: 2, label: "主要参与者", help: "基金委项目主要参与者，不包括学生。" },
  { value: 3, label: "课题负责人", help: "国家科技计划项目下设课题的负责人。" },
  { value: 4, label: "学术带头人", help: "卓越研究群体或原基础科学中心的学术带头人。" },
  { value: 5, label: "项目骨干 / 骨干成员", help: "科技计划项目骨干或群体项目骨干成员。" },
  { value: 6, label: "其他研究人员", help: "2026年11月五专项指南将其他研究人员纳入内部2项总数。" }
];

const statuses: Option[] = [
  { value: 0, label: "拟申报 / 同时申请", help: "本年度准备提交或正在同时准备的项目。" },
  { value: 1, label: "已正式受理", help: "正式接收后，部分青年和群体项目才开始计入总数。" },
  { value: 2, label: "评审中", help: "通常计入限项；是否进入现场考察或预算评审也可能影响计数。" },
  { value: 3, label: "正在承担", help: "是否仍在限项期内由所选指南和精确结束日期判断。" },
  { value: 4, label: "已退出团队", help: "科技部项目在原执行期内原则上仍可能禁止申报。" },
  { value: 5, label: "初审不予受理", help: "不计入当前申请和承担项目数量。" },
  { value: 6, label: "未获资助", help: "资助决定为不予资助后不再计入。" },
  { value: 7, label: "已经结题", help: "项目已经完成结题手续；部分获资助次数规定仍会参考历史记录。" }
];

const titles: Option[] = [
  { value: 0, label: "高级专业技术职务（职称）", help: "基金委通用申请与承担总数通常合计限2项。" },
  { value: 1, label: "非高级专业技术职务（职称）", help: "申请人/负责人和主要参与者分别适用不同上限。" }
];

const years = Array.from({ length: 31 }, (_, index) => 2010 + index);
const months = Array.from({ length: 12 }, (_, index) => index + 1);
const days = Array.from({ length: 31 }, (_, index) => index + 1);
const currentYear = 2026;

const nsfcSource = "https://www.nsfc.gov.cn/u/cms/www/202601/190844586k0w.pdf";
const jointSource = "https://www.most.gov.cn/xxgk/xinxifenlei/fdzdgknr/fgzc/gfxwj/gfxwj2022/202208/t20220810_181836.html";
const mostLifeSource = "https://fuwu.most.gov.cn/html/tztg/xzxkzx/20260720/123125196.html";
const mostFiveSource = "https://service.most.gov.cn/kjjh_tztg_all/20261110/5933.html";

const ruleText: Record<string, { title: string; body: string; source: string; href: string }> = {
  "NSFC-2026-GENERAL-1": { title: "同年同类型申请超过1项", body: "作为申请人，本年度同类型项目数量超过一般上限。主要参与者不会触发这条申请人限制。", source: "基金委2026申请规定，二（一）1", href: nsfcSource },
  "NSFC-2026-GENERAL-2": { title: "上年度获资助后不能再次申请同类型", body: "上年度获得相应类型资助，本年度不得继续作为申请人申请同类型项目。", source: "基金委2026申请规定，二（一）2", href: nsfcSource },
  "NSFC-2026-TOTAL-SENIOR-2": { title: "高级职称人员项目总数超过2项", body: "计入范围的申请和正在承担项目总数超过2项。", source: "基金委2026申请规定，二（二）1", href: nsfcSource },
  "NSFC-2026-TOTAL-NONSENIOR-LEADER-1": { title: "非高级职称人员负责人项目数超过1项", body: "作为申请人申请和作为负责人正在承担的项目合计超过1项。", source: "基金委2026申请规定，二（二）1", href: nsfcSource },
  "NSFC-2026-TOTAL-NONSENIOR-PARTICIPANT-2": { title: "非高级职称人员参与项目数超过2项", body: "作为主要参与者申请和正在承担的项目合计超过2项。", source: "基金委2026申请规定，二（二）1", href: nsfcSource },
  "JOINT-2022-107-LIMIT-2": { title: "国家科技计划联合限项超过2项", body: "符合跨部门实施范围的申请和在研项目合计超过2项。", source: "国科办资〔2022〕107号，二、三（一）", href: jointSource },
  "JOINT-2022-107-INSTRUMENT-LIMIT-1": { title: "科学仪器项目联合限项超过1项", body: "重大科研仪器项目与国家重点研发计划科学仪器方向项目合计超过1项。", source: "国科办资〔2022〕107号，三（一）", href: jointSource },
  "MOST-2026-PRINCIPAL-APPLICATION-LIMIT-1": { title: "同期牵头申报超过1项", body: "作为项目或课题负责人，同期申报国家重点研发计划和国家科技重大专项合计限1项。", source: "科技部2026专项指南，限项要求1", href: mostFiveSource },
  "MOST-2026-ACTIVE-PROJECT-PRINCIPAL": { title: "在研项目负责人不得再次申报或参与", body: "在研国家重点研发计划或国家科技重大专项项目负责人，不得牵头或参与新的项目（课题）申报。", source: "科技部2026专项指南，限项要求2", href: mostFiveSource },
  "MOST-2026-ACTIVE-TASK-PRINCIPAL-LEAD": { title: "在研课题负责人不得再次牵头", body: "当前所选指南只允许在研课题负责人继续作为非负责人角色参与，不允许再次作为项目或课题负责人牵头申报。", source: "科技部2026专项指南，限项要求2", href: mostFiveSource },
  "MOST-2026-PERSONNEL-TOTAL-2": { title: "国家科技计划人员项目总数超过2项", body: "所选指南纳入的申报和在研项目（课题）总数超过2项。", source: "科技部2026专项指南，限项要求3", href: mostFiveSource },
  "MOST-2026-WITHDRAWAL-ORIGINAL-TERM": { title: "退出原项目后仍在原执行期内", body: "退出项目团队后，在原项目执行期内原则上不得牵头或参与新的国家重点研发计划项目。", source: "科技部2026专项指南，限项要求4", href: mostLifeSource }
};

const reviewText: Record<string, { title: string; body: string }> = {
  "REVIEW-MOST-GUIDE-VERSION": { title: "请选择本次申报对应的科技部指南", body: "不同重点专项和申报批次的限项口径不同。选定指南后，检查器才能给出对应的判断。" },
  "REVIEW-NSFC-SPECIAL-RULES": { title: "请再核对这类项目的专项规定", body: "通用数量检查已经完成；这类项目还可能涉及项目亚类、获资助次数或交叉限项。" }
};

const modelFiles = [
  { id: "model", name: "Model.v", description: "中文领域类型、指南版本、状态与判定结果", source: modelSource },
  { id: "rules", name: "Rules2026.v", description: "精确日期谓词、基金委与科技部2026规则", source: rulesSource },
  { id: "checker", name: "Checker.v", description: "限项原因、待核对事项与检查结论", source: checkerSource },
  { id: "soundness", name: "Soundness.v", description: "诊断可靠性与边界示例", source: soundnessSource }
];

let projects: ProjectInput[] = [];

function guidesForAgency(agency: number): GuideOption[] { return guides.filter((item) => item.agency === agency); }
function kindsForAgency(agency: number): KindOption[] { return kinds.filter((item) => item.agency === agency); }
function tagsFor(agency: number, kind: number): Option[] {
  if (agency === 0) return kind === 11 ? tags.filter((item) => item.value === 0 || item.value === 6) : tags.filter((item) => item.value === 0);
  if (kind === 17) return tags.filter((item) => [0, 1, 2, 3, 4, 5, 7].includes(item.value));
  if (kind === 18) return tags.filter((item) => item.value === 0 || item.value === 1);
  return tags.filter((item) => item.value === 0);
}
function rolesFor(agency: number, candidate: boolean, guide = 3, kind = 0): Option[] {
  if (agency === 0) {
    let allowed = candidate ? [0, 2] : [0, 1, 2];
    if (kind === 2 && !candidate) allowed = [0, 1, 2, 3];
    if (kind === 12 || kind === 13) allowed = candidate ? [0, 2, 4, 5] : [0, 1, 2, 4, 5];
    return roles.filter((item) => allowed.includes(item.value));
  }
  const allowed = guide === 1 ? [1, 3, 5] : [1, 3, 5, 6];
  return roles.filter((item) => allowed.includes(item.value));
}
function statusesFor(agency: number): Option[] { return agency === 0 ? statuses.filter((item) => item.value !== 4) : statuses; }

function info(help: string, id?: string): string { return `<span class="info" tabindex="0" aria-label="说明：${help}">i<span class="tooltip" ${id ? `id="${id}"` : ""} role="tooltip">${help}</span></span>`; }
function options(values: Option[], selected: number): string { return values.map((item) => `<option value="${item.value}" ${item.value === selected ? "selected" : ""}>${item.label}</option>`).join(""); }
function selectField(id: string, label: string, values: Option[], selected: number, help: string): string { const selectedHelp = values.find((item) => item.value === selected)?.help ?? help; return `<label class="field"><span>${label} ${info(selectedHelp, `${id}-help`)}</span><select id="${id}" aria-describedby="${id}-help">${options(values, selected)}</select></label>`; }
function yearField(id: string, label: string, selected: number, help: string, fixed = false): string { const values = fixed ? [2026] : years; return `<label class="field"><span>${label} ${info(help)}</span><select id="${id}">${values.map((year) => `<option value="${year}" ${year === selected ? "selected" : ""}>${year}年</option>`).join("")}</select></label>`; }
function monthField(id: string, selected: number): string { return `<label class="field compact"><span>结束月 ${info("科技部部分指南按2026年12月31日这一精确日期判断。")}</span><select id="${id}">${months.map((month) => `<option value="${month}" ${month === selected ? "selected" : ""}>${month}月</option>`).join("")}</select></label>`; }
function dayField(id: string, selected: number): string { return `<label class="field compact"><span>结束日 ${info("请选择正式任务书中包括延期后的执行期结束日。")}</span><select id="${id}">${days.map((day) => `<option value="${day}" ${day === selected ? "selected" : ""}>${day}日</option>`).join("")}</select></label>`; }
function numberField(id: string, label: string, value: number, help: string): string { return `<label class="field"><span>${label} ${info(help, `${id}-help`)}</span><input id="${id}" type="number" inputmode="numeric" min="0" max="100000" step="1" value="${value}" aria-describedby="${id}-help"></label>`; }

document.querySelector<HTMLDivElement>("#app")!.innerHTML = `
  <header class="site-header"><div class="header-inner"><a class="brand" href="#">纵向项目限项检查器 <span class="beta">MVP</span></a><nav aria-label="主导航"><a href="#tools">使用工具</a><a href="#sources">规则来源</a><a href="https://github.com/zhezhouzz/grant-limit-checker" target="_blank" rel="noreferrer">GitHub ↗</a></nav></div></header>
  <main>
    <section class="hero"><p class="eyebrow">Grant limit checker · Rocq verified core</p><h1>严格形式化的<br><em>项目限项检查器</em></h1><p class="lead">填写你正在承担、同时申报，以及准备申请或参与的项目。检查器会告诉你是否存在限项冲突，并说明判断理由。</p>
      <div class="early-badge"><strong>早期版本 · 仅覆盖部分规则</strong><span>目前包括基金委 2026 年通用规则、跨部门联合限项和两批科技部专项指南。</span></div>
      <div class="principles" role="list" aria-label="项目原则"><article class="principle unofficial" role="listitem"><span>01</span><div><strong>非官方工具</strong><p>结果仅供申报准备参考，请以当年正式指南和主管部门解释为准。</p></div></article><article class="principle" role="listitem"><span>02</span><div><strong>中文规则</strong><p>规则以中文写入 Rocq，便于查阅和核对。</p></div></article><article class="principle" role="listitem"><span>03</span><div><strong>可执行内核</strong><p>形式化定义会从 Rocq 抽取成 OCaml 程序，并直接在浏览器中运行。</p></div></article></div>
    </section>
    <section id="tools" class="view-switch" aria-label="选择工具" role="tablist"><button id="show-checker" class="view-tab active" type="button" role="tab" aria-selected="true" aria-controls="checker-view"><span>01</span>限项检查器</button><button id="show-model" class="view-tab" type="button" role="tab" aria-selected="false" aria-controls="model-view"><span>02</span>形式化模型</button></section>
    <div id="checker-view" class="view-panel" role="tabpanel" aria-labelledby="show-checker">
      <section id="checker" class="checker" aria-labelledby="checker-title"><div class="section-heading"><div><span class="step">01</span><h2 id="checker-title">个人情况</h2></div></div><div class="field-grid single">${selectField("current-title", "当前专业技术职务", titles, 0, "职称会影响部分项目数量上限。")}</div>
        <div class="section-heading subsection"><div><span class="step">02</span><h2>拟申请或拟参与项目</h2></div></div><div id="candidate" class="field-grid">${selectField("candidate-agency", "主管部门 / 计划体系", agencies, 0, "选择本次申报所属的计划体系。")}${selectField("candidate-guide", "适用指南版本", guidesForAgency(0), 0, "选择本次申报所依据的指南。")}${selectField("candidate-kind", "项目类型", kindsForAgency(0), 0, "选择准备申请或参与的项目类型。")}${selectField("candidate-tag", "项目标识", tagsFor(0, 0), 0, "选择项目所属的专项类别。")}${selectField("candidate-role", "你的角色", rolesFor(0, true, 0, 0), 0, "选择你准备在项目中担任的角色。")}${yearField("candidate-year", "申请年度", currentYear, "本页检查2026年度申报。", true)}${yearField("candidate-start", "预计开始年度", 2027, "项目计划开始执行的年度。")}${yearField("candidate-end", "预计结束年度", 2029, "项目计划结束执行的年度。")}${monthField("candidate-end-month", 12)}${dayField("candidate-end-day", 31)}${numberField("candidate-cost", "基金委直接费用（万元）", 0, "用于判断组织间国际合作项目是否超过200万元。")}${numberField("candidate-budget", "中央财政专项资金预算（万元）", 0, "用于判断科技部国际合作项目是否适用400万元的规定。")}</div>
        <div class="section-heading subsection"><div><span class="step">03</span><h2>已有或同时申请的项目</h2></div><button id="add-project" class="button secondary" type="button">＋ 添加项目</button></div><div id="project-list" class="project-list"></div><div id="empty-state" class="empty-state">尚未添加已有项目，可以直接检查。</div><div class="actions"><button id="run-check" class="button primary" type="button">运行形式化检查 <span>⌘↵</span></button><span id="kernel-status" class="kernel-status">正在加载 OCaml 内核…</span></div>
      </section><section id="result" class="result hidden" aria-live="polite"></section>
      <section id="sources" class="sources"><div class="section-heading"><div><span class="step">04</span><h2>规则来源</h2></div></div><div class="source-grid"><article><h3>国家自然科学基金</h3><p>《2026年度国家自然科学基金项目指南——申请规定》</p><a href="${nsfcSource}" target="_blank" rel="noreferrer">查看基金委PDF ↗</a></article><article><h3>科技部2026专项指南</h3><p>包括7月发布的两个重点专项指南和11月发布的五个重点专项指南。</p><a href="${mostFiveSource}" target="_blank" rel="noreferrer">查看五专项指南 ↗</a></article><article><h3>发现问题？</h3><p>欢迎提交正式来源、规则纠错或匿名化案例。</p><a href="https://github.com/zhezhouzz/grant-limit-checker/issues/new?template=rule-report.yml" target="_blank" rel="noreferrer">提交规则 Issue ↗</a></article></div></section>
    </div>
    <section id="model-view" class="view-panel model-view hidden" role="tabpanel" aria-labelledby="show-model"><div class="model-intro"><p class="eyebrow">Rocq source · synchronized at build time</p><h2>主要形式化模型</h2><p>以下内容在网页构建时直接读取本版本仓库中的 Rocq 源文件。</p></div><div class="model-layout"><nav class="file-tabs" aria-label="形式化文件">${modelFiles.map((file, index) => `<button class="file-tab ${index === 0 ? "active" : ""}" type="button" data-file="${file.id}"><strong>${file.name}</strong><span>${file.description}</span></button>`).join("")}</nav><div class="code-panel"><div class="code-head"><div><strong id="code-name"></strong><span id="code-description"></span></div><a id="code-github" target="_blank" rel="noreferrer">在 GitHub 查看 ↗</a></div><pre tabindex="0"><code id="model-code"></code></pre></div></div></section>
  </main><footer><p>非官方 · 中文规则 · Rocq → OCaml</p><a href="https://github.com/zhezhouzz/grant-limit-checker/blob/main/LICENSE">MIT License</a></footer>`;

function updateHelp(select: HTMLSelectElement, values: Option[]): void { const help = document.querySelector<HTMLElement>(`#${select.id}-help`); const text = values.find((item) => item.value === Number(select.value))?.help ?? ""; if (help) { help.textContent = text; help.parentElement?.setAttribute("aria-label", `说明：${text}`); } }
function bindHelp(id: string, values: Option[]): void { const select = document.querySelector<HTMLSelectElement>(`#${id}`); select?.addEventListener("change", () => updateHelp(select, values)); }
function setSelect(id: string, values: Option[], preferred?: number): number { const select = document.querySelector<HTMLSelectElement>(`#${id}`); if (!select) return values[0].value; const chosen = values.some((item) => item.value === preferred) ? preferred! : values[0].value; select.innerHTML = options(values, chosen); updateHelp(select, values); return chosen; }
function selectNumber(id: string, fallback: number): number { const value = Number(document.querySelector<HTMLInputElement | HTMLSelectElement>(`#${id}`)?.value ?? fallback); return Number.isFinite(value) && value >= 0 ? Math.trunc(value) : fallback; }

function projectCard(project: ProjectInput, index: number): string {
  return `<article class="project-card" data-index="${index}"><div class="project-card-header"><h3>项目 ${index + 1}</h3><button class="remove-project" data-index="${index}" type="button" aria-label="删除项目 ${index + 1}">删除</button></div><div class="field-grid project-fields">${selectField(`agency-${index}`, "主管部门 / 计划体系", agencies, project.agency, "选择这个项目所属的计划体系。")}${selectField(`guide-${index}`, "适用指南版本", guidesForAgency(project.agency), project.guide, "选择这个项目申报时所依据的指南；如果暂时不确定，可选择“暂不确定具体指南”。")}${selectField(`kind-${index}`, "项目类型", kindsForAgency(project.agency), project.kind, "选择这个项目的具体类型。")}${selectField(`tag-${index}`, "项目标识", tagsFor(project.agency, project.kind), project.tag, "选择这个项目所属的专项类别。")}${selectField(`role-${index}`, "你的角色", rolesFor(project.agency, false, project.guide, project.kind), project.role, "选择你在这个项目中担任的角色。")}${selectField(`status-${index}`, "项目状态 / 申报阶段", statusesFor(project.agency), project.status, "选择这个项目目前所处的阶段。")}${yearField(`start-${index}`, "批准 / 开始年度", project.startYear, "填写项目获批或开始执行的年度。")}${yearField(`end-${index}`, "执行期结束年度", project.endYear, "填写项目执行期结束的年度；如果已经获批延期，请填写延期后的时间。")}${monthField(`end-month-${index}`, project.endMonth)}${dayField(`end-day-${index}`, project.endDay)}${numberField(`cost-${index}`, "基金委直接费用（万元）", project.directCost, "用于判断组织间国际合作项目是否超过200万元。")}${numberField(`budget-${index}`, "中央财政专项资金预算（万元）", project.centralBudget, "用于判断科技部国际合作项目是否适用400万元的规定。")}${selectField(`title-${index}`, "批准时职称", titles, project.titleAtApproval, "请填写项目获批时的职称，用于判断职称变化后的计数方式。")}</div></article>`;
}

function collectProjects(): void { projects = projects.map((project, index) => ({ agency: selectNumber(`agency-${index}`, project.agency), kind: selectNumber(`kind-${index}`, project.kind), guide: selectNumber(`guide-${index}`, project.guide), tag: selectNumber(`tag-${index}`, project.tag), role: selectNumber(`role-${index}`, project.role), status: selectNumber(`status-${index}`, project.status), startYear: selectNumber(`start-${index}`, project.startYear), endYear: selectNumber(`end-${index}`, project.endYear), endMonth: selectNumber(`end-month-${index}`, project.endMonth), endDay: selectNumber(`end-day-${index}`, project.endDay), directCost: selectNumber(`cost-${index}`, project.directCost), centralBudget: selectNumber(`budget-${index}`, project.centralBudget), titleAtApproval: selectNumber(`title-${index}`, project.titleAtApproval) })); }

function renderProjects(): void {
  const list = document.querySelector<HTMLDivElement>("#project-list"); const empty = document.querySelector<HTMLDivElement>("#empty-state"); if (!list || !empty) return;
  list.innerHTML = projects.map(projectCard).join(""); empty.classList.toggle("hidden", projects.length > 0);
  projects.forEach((_, index) => {
    bindHelp(`agency-${index}`, agencies); bindHelp(`guide-${index}`, guides); bindHelp(`kind-${index}`, kinds); bindHelp(`tag-${index}`, tags); bindHelp(`role-${index}`, roles); bindHelp(`status-${index}`, statusesFor(projects[index].agency)); bindHelp(`title-${index}`, titles);
    document.querySelector<HTMLSelectElement>(`#agency-${index}`)?.addEventListener("change", (event) => { collectProjects(); const agency = Number((event.currentTarget as HTMLSelectElement).value); projects[index].agency = agency; projects[index].guide = guidesForAgency(agency)[0].value; projects[index].kind = kindsForAgency(agency)[0].value; projects[index].tag = 0; projects[index].role = rolesFor(agency, false, projects[index].guide, projects[index].kind)[0].value; projects[index].status = agency === 0 && projects[index].status === 4 ? 3 : projects[index].status; renderProjects(); });
    document.querySelector<HTMLSelectElement>(`#guide-${index}`)?.addEventListener("change", (event) => { collectProjects(); projects[index].guide = Number((event.currentTarget as HTMLSelectElement).value); const available = rolesFor(projects[index].agency, false, projects[index].guide, projects[index].kind); if (!available.some((item) => item.value === projects[index].role)) projects[index].role = available[0].value; renderProjects(); });
    document.querySelector<HTMLSelectElement>(`#kind-${index}`)?.addEventListener("change", (event) => { collectProjects(); projects[index].kind = Number((event.currentTarget as HTMLSelectElement).value); projects[index].tag = tagsFor(projects[index].agency, projects[index].kind)[0].value; const available = rolesFor(projects[index].agency, false, projects[index].guide, projects[index].kind); if (!available.some((item) => item.value === projects[index].role)) projects[index].role = available[0].value; renderProjects(); });
    document.querySelector<HTMLSelectElement>(`#status-${index}`)?.addEventListener("change", (event) => { collectProjects(); projects[index].status = Number((event.currentTarget as HTMLSelectElement).value); if (projects[index].agency === 0) { const applicationStage = [0, 1, 2, 5, 6].includes(projects[index].status); if (applicationStage && projects[index].role === 1) projects[index].role = 0; if (!applicationStage && projects[index].role === 0) projects[index].role = 1; } renderProjects(); });
  });
  list.querySelectorAll<HTMLButtonElement>(".remove-project").forEach((button) => button.addEventListener("click", () => { collectProjects(); projects.splice(Number(button.dataset.index), 1); renderProjects(); }));
}

function encode(project: ProjectInput): string { return [project.kind, project.guide, project.tag, project.role, project.status, project.startYear, project.endYear, project.endMonth, project.endDay, project.directCost, project.centralBudget, project.titleAtApproval].join(","); }

function runCheck(): void {
  collectProjects(); const title = selectNumber("current-title", 0); const applicationYear = selectNumber("candidate-year", currentYear); const agency = selectNumber("candidate-agency", 0);
  const candidate: ProjectInput = { agency, kind: selectNumber("candidate-kind", 0), guide: selectNumber("candidate-guide", 0), tag: selectNumber("candidate-tag", 0), role: selectNumber("candidate-role", 0), status: 0, startYear: selectNumber("candidate-start", 2027), endYear: selectNumber("candidate-end", 2029), endMonth: selectNumber("candidate-end-month", 12), endDay: selectNumber("candidate-end-day", 31), directCost: selectNumber("candidate-cost", 0), centralBudget: selectNumber("candidate-budget", 0), titleAtApproval: title };
  const resultElement = document.querySelector<HTMLElement>("#result"); if (!resultElement) return;
  if (!window.GrantLimitKernel) { resultElement.classList.remove("hidden"); resultElement.innerHTML = `<div class="verdict invalid"><span>!</span><div><p>内核未加载</p><h2>无法运行检查</h2></div></div>`; return; }
  const result = JSON.parse(window.GrantLimitKernel.check(title, applicationYear, encode(candidate), projects.map(encode).join(";"))) as KernelResult; renderResult(result, title, agency);
}

function renderResult(result: KernelResult, title: number, agency: number): void {
  const element = document.querySelector<HTMLElement>("#result"); if (!element) return; element.classList.remove("hidden");
  if (!result.ok) { element.innerHTML = `<div class="verdict invalid"><span>!</span><div><p>请检查填写内容</p><h2>项目类型、角色或日期不匹配</h2></div></div>`; return; }
  const blocked = result.decision === "blocked"; const review = result.decision === "review";
  const symbol = blocked ? "×" : review ? "?" : "✓"; const verdictClass = blocked ? "blocked" : review ? "review" : "allowed"; const heading = blocked ? "发现限项冲突" : review ? "还有专项规定需要核对" : "未发现限项冲突";
  const countSummary = agency === 0
    ? (title === 0 ? `基金委通用总数：<strong>${result.counts.total}</strong> / 2` : `负责人：<strong>${result.counts.leader}</strong> / 1　参与者：<strong>${result.counts.participant}</strong> / 2`)
    : `专项内部总数：<strong>${result.counts.mostInternal}</strong> / 2`;
  const violations = result.violations.map((code) => { const rule = ruleText[code]; return `<div class="diagnostic fail"><code>${code}</code><div><h3>${rule?.title ?? "触发限项规则"}</h3><p>${rule?.body ?? "请查阅对应规则。"}</p><a href="${rule?.href ?? nsfcSource}" target="_blank" rel="noreferrer">${rule?.source ?? "查看来源"} ↗</a></div></div>`; }).join("");
  const reviews = result.reviews.map((code) => { const item = reviewText[code]; return `<div class="diagnostic review"><code>${code}</code><div><h3>${item?.title ?? "请继续核对专项规定"}</h3><p>${item?.body ?? "请结合本次申报指南确认。"}</p></div></div>`; }).join("");
  const pass = !blocked && !review ? `<div class="diagnostic pass"><code>CHECK-PASSED</code><div><h3>检查完成</h3><p>根据你选择的项目和指南，没有发现限项冲突。</p></div></div>` : "";
  element.innerHTML = `<div class="result-head"><div class="verdict ${verdictClass}"><span>${symbol}</span><div><p>Rocq → OCaml 判定</p><h2>${heading}</h2></div></div><div class="count-summary">${countSummary}<small>跨部门联合：${result.counts.joint} / 2 · 科学仪器联合：${result.counts.instrumentJoint} / 1 · 同类型申请：${result.counts.sameType}</small></div></div><div class="diagnostics"><h3 class="diagnostics-title">检查结果</h3>${violations}${reviews}${pass}</div><div class="coverage-warning">本工具为非官方项目，结果仅供申报准备参考，请以当年正式指南和主管部门解释为准。</div>`; element.scrollIntoView({ behavior: "smooth", block: "start" });
}

function showView(view: "checker" | "model"): void { const checker = document.querySelector<HTMLElement>("#checker-view"); const model = document.querySelector<HTMLElement>("#model-view"); const checkerButton = document.querySelector<HTMLButtonElement>("#show-checker"); const modelButton = document.querySelector<HTMLButtonElement>("#show-model"); const checkerActive = view === "checker"; checker?.classList.toggle("hidden", !checkerActive); model?.classList.toggle("hidden", checkerActive); checkerButton?.classList.toggle("active", checkerActive); modelButton?.classList.toggle("active", !checkerActive); checkerButton?.setAttribute("aria-selected", String(checkerActive)); modelButton?.setAttribute("aria-selected", String(!checkerActive)); }
function showModelFile(id: string): void { const file = modelFiles.find((item) => item.id === id) ?? modelFiles[0]; const code = document.querySelector<HTMLElement>("#model-code"); const name = document.querySelector<HTMLElement>("#code-name"); const description = document.querySelector<HTMLElement>("#code-description"); const github = document.querySelector<HTMLAnchorElement>("#code-github"); if (code) code.textContent = file.source; if (name) name.textContent = file.name; if (description) description.textContent = file.description; if (github) github.href = `https://github.com/zhezhouzz/grant-limit-checker/blob/main/formal/${file.name}`; document.querySelectorAll<HTMLButtonElement>(".file-tab").forEach((button) => button.classList.toggle("active", button.dataset.file === file.id)); }

function refreshCandidateDependencies(): void { const agency = selectNumber("candidate-agency", 0); const guide = setSelect("candidate-guide", guidesForAgency(agency), selectNumber("candidate-guide", guidesForAgency(agency)[0].value)); const kind = selectNumber("candidate-kind", kindsForAgency(agency)[0].value); setSelect("candidate-kind", kindsForAgency(agency), kind); const normalizedKind = selectNumber("candidate-kind", kindsForAgency(agency)[0].value); setSelect("candidate-tag", tagsFor(agency, normalizedKind), selectNumber("candidate-tag", 0)); const availableRoles = rolesFor(agency, true, guide, normalizedKind); setSelect("candidate-role", availableRoles, selectNumber("candidate-role", availableRoles[0].value)); }

document.querySelector<HTMLButtonElement>("#add-project")?.addEventListener("click", () => { collectProjects(); projects.push({ agency: 0, guide: 0, kind: 0, tag: 0, role: 1, status: 3, startYear: 2025, endYear: 2028, endMonth: 12, endDay: 31, directCost: 0, centralBudget: 0, titleAtApproval: selectNumber("current-title", 0) }); renderProjects(); });
document.querySelector<HTMLButtonElement>("#run-check")?.addEventListener("click", runCheck);
document.querySelector<HTMLButtonElement>("#show-checker")?.addEventListener("click", () => showView("checker")); document.querySelector<HTMLButtonElement>("#show-model")?.addEventListener("click", () => showView("model"));
document.querySelectorAll<HTMLButtonElement>(".file-tab").forEach((button) => button.addEventListener("click", () => showModelFile(button.dataset.file ?? "model")));
document.querySelector<HTMLSelectElement>("#candidate-agency")?.addEventListener("change", () => { const agency = selectNumber("candidate-agency", 0); const guide = setSelect("candidate-guide", guidesForAgency(agency)); const kind = setSelect("candidate-kind", kindsForAgency(agency)); setSelect("candidate-tag", tagsFor(agency, kind)); setSelect("candidate-role", rolesFor(agency, true, guide, kind)); });
document.querySelector<HTMLSelectElement>("#candidate-guide")?.addEventListener("change", () => refreshCandidateDependencies());
document.querySelector<HTMLSelectElement>("#candidate-kind")?.addEventListener("change", () => refreshCandidateDependencies());
document.addEventListener("keydown", (event) => { if ((event.metaKey || event.ctrlKey) && event.key === "Enter") runCheck(); });
bindHelp("candidate-agency", agencies); bindHelp("candidate-guide", guides); bindHelp("candidate-kind", kinds); bindHelp("candidate-tag", tags); bindHelp("candidate-role", roles); bindHelp("current-title", titles); renderProjects(); showModelFile("model");
const kernelStatus = document.querySelector<HTMLElement>("#kernel-status"); if (kernelStatus) { kernelStatus.textContent = window.GrantLimitKernel ? "● OCaml 内核已加载" : "○ OCaml 内核加载失败"; kernelStatus.classList.toggle("ready", Boolean(window.GrantLimitKernel)); }
