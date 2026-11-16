From Stdlib Require Import Extraction ExtrOcamlBasic ExtrOcamlNatInt.
From GrantLimit Require Import Model Rules2026 Checker.

Extraction Language OCaml.
Set Extraction Output Directory ".".
Set Extraction Optimize.
Set Extraction AutoInline.

Extract Constant 年份阈值2020 => "2020".
Extract Constant 年份阈值2023 => "2023".
Extract Constant 费用阈值200万元 => "200".

(* Rocq 源码使用中文领域名称；OCaml ABI 保持稳定的 ASCII 名称。 *)
Extract Inductive 专业技术职称 => "Domain_types.professional_title"
  [ "Domain_types.Senior" "Domain_types.NonSenior" ].
Extract Inductive 项目类别 => "Domain_types.project_kind"
  [ "Domain_types.General" "Domain_types.Key" "Domain_types.Major"
    "Domain_types.MajorResearch" "Domain_types.Joint" "Domain_types.YoungC"
    "Domain_types.YoungB" "Domain_types.YoungA" "Domain_types.Regional"
    "Domain_types.KeyInternational" "Domain_types.OrganizationInternational"
    "Domain_types.MajorInstrument" "Domain_types.InnovativeGroup"
    "Domain_types.ExcellenceGroup" "Domain_types.OriginalExplorationLong"
    "Domain_types.SpecialLong" "Domain_types.ExemptKind" ].
Extract Inductive 项目角色 => "Domain_types.project_role"
  [ "Domain_types.Applicant" "Domain_types.Principal" "Domain_types.Participant" ].
Extract Inductive 项目状态 => "Domain_types.project_status"
  [ "Domain_types.Applying" "Domain_types.Active" "Domain_types.EndsInApplicationYear"
    "Domain_types.RejectedAtInitialReview" "Domain_types.Completed" ].
Extract Inductive 违规原因 => "Domain_types.violation"
  [ "Domain_types.SameTypeApplicationLimit" "Domain_types.SeniorTotalLimit"
    "Domain_types.NonSeniorLeaderLimit" "Domain_types.NonSeniorParticipantLimit" ].
Extract Inductive 判定结果 => "Domain_types.decision"
  [ "Domain_types.Allowed" "Domain_types.Blocked" ].

(* 下面仅定义 ASCII 形式的 OCaml 导出包装器；领域规则仍以中文名称为准。 *)
Definition same_type_application_count := 同类申请总数.
Definition total_count := 项目总数.
Definition leader_count := 负责人项目总数.
Definition participant_count := 参与者项目总数.
Definition violations := 违规列表.
Definition check := 检查.

Extraction "kernel/generated/extracted.ml"
  专业技术职称 项目类别 项目角色 项目状态
  project profile 违规原因 判定结果
  mkProject mkProfile
  same_type_application_count total_count leader_count participant_count
  violations check.
