From Stdlib Require Import Extraction ExtrOcamlBasic ExtrOcamlNatInt.
From GrantLimit Require Import Model Rules2026 Checker.

Extraction Language OCaml.
Set Extraction Output Directory ".".
Set Extraction Optimize.
Set Extraction AutoInline.

Extract Constant 年份阈值2020 => "2020".
Extract Constant 年份阈值2023 => "2023".
Extract Constant 年份阈值2024 => "2024".
Extract Constant 费用阈值200万元 => "200".
Extract Constant 预算阈值400万元 => "400".

(* Rocq 源码使用中文领域名称；OCaml ABI 保持稳定的 ASCII 名称。 *)
Extract Inductive 专业技术职称 => "Domain_types.professional_title"
  [ "Domain_types.Senior" "Domain_types.NonSenior" ].
Extract Inductive 指南版本 => "Domain_types.guide_version"
  [ "Domain_types.Nsfc2026" "Domain_types.Most2026LifeScience"
    "Domain_types.Most2026MathPhysicsAi" "Domain_types.MostGuideUnspecified" ].
Extract Inductive 项目类别 => "Domain_types.project_kind"
  [ "Domain_types.General" "Domain_types.Key" "Domain_types.Major"
    "Domain_types.MajorResearch" "Domain_types.Joint" "Domain_types.YoungC"
    "Domain_types.YoungB" "Domain_types.YoungA" "Domain_types.Regional"
    "Domain_types.KeyInternational" "Domain_types.OrganizationInternational"
    "Domain_types.MajorInstrument" "Domain_types.InnovativeGroup"
    "Domain_types.ExcellenceGroup" "Domain_types.OriginalExplorationLong"
    "Domain_types.SpecialLong" "Domain_types.ExemptKind"
    "Domain_types.NationalKeyRAndD" "Domain_types.NationalMajorProgram"
    "Domain_types.CasStrategicHighGround" "Domain_types.NationalLaboratoryProgram" ].
Extract Inductive 项目标识 => "Domain_types.project_tag"
  [ "Domain_types.NoSpecialTag" "Domain_types.YoungScientist"
    "Domain_types.SmeProject" "Domain_types.InternationalCooperation"
    "Domain_types.IntergovernmentalCooperation"
    "Domain_types.StrategicHkMacaoTaiwanCooperation"
    "Domain_types.DepartmentRecommended" "Domain_types.ScientificInstrumentDirection" ].
Extract Inductive 项目角色 => "Domain_types.project_role"
  [ "Domain_types.Applicant" "Domain_types.Principal" "Domain_types.Participant"
    "Domain_types.TaskPrincipal" "Domain_types.AcademicLeader" "Domain_types.KeyMember"
    "Domain_types.OtherResearcher" ].
Extract Inductive 项目状态 => "Domain_types.project_status"
  [ "Domain_types.Applying" "Domain_types.FormallyAccepted" "Domain_types.UnderReview"
    "Domain_types.Active" "Domain_types.Withdrawn"
    "Domain_types.RejectedAtInitialReview" "Domain_types.NotFunded"
    "Domain_types.Completed" ].
Extract Inductive 违规原因 => "Domain_types.violation"
  [ "Domain_types.SameTypeApplicationLimit" "Domain_types.PreviousYearSameTypeAwardLimit"
    "Domain_types.SeniorTotalLimit"
    "Domain_types.NonSeniorLeaderLimit" "Domain_types.NonSeniorParticipantLimit"
    "Domain_types.JointNationalProgramLimit" "Domain_types.ScientificInstrumentJointLimit"
    "Domain_types.MostConcurrentPrincipalApplicationLimit"
    "Domain_types.ActiveNationalProjectPrincipalLimit"
    "Domain_types.ActiveNationalTaskPrincipalLeadLimit"
    "Domain_types.MostPersonnelTotalLimit" "Domain_types.WithdrawnNationalProjectLimit" ].
Extract Inductive 复核原因 => "Domain_types.review_reason"
  [ "Domain_types.MostGuideVersionRequired" "Domain_types.NsfcSpecialRulesIncomplete" ].
Extract Inductive 判定结果 => "Domain_types.decision"
  [ "Domain_types.Allowed" "Domain_types.Blocked" "Domain_types.NeedsReview" ].

(* 下面仅定义 ASCII 形式的 OCaml 导出包装器；领域规则仍以中文名称为准。 *)
Definition same_type_application_count := 同类申请总数.
Definition total_count := 项目总数.
Definition leader_count := 负责人项目总数.
Definition participant_count := 参与者项目总数.
Definition joint_count := 联合限项项目总数.
Definition most_internal_count := 科技部内部项目总数.
Definition instrument_joint_count := 科学仪器联合限项总数.
Definition violations := 违规列表.
Definition review_reasons := 复核原因列表.
Definition check := 检查.

Extraction "kernel/generated/extracted.ml"
  专业技术职称 指南版本 项目类别 项目标识 项目角色 项目状态
  project profile 违规原因 复核原因 判定结果
  mkProject mkProfile
  same_type_application_count total_count leader_count participant_count joint_count
  most_internal_count instrument_joint_count violations review_reasons check.
