type professional_title = Senior | NonSenior

type guide_version =
  | Nsfc2026
  | Most2026LifeScience
  | Most2026MathPhysicsAi
  | MostGuideUnspecified

type project_kind =
  | General
  | Key
  | Major
  | MajorResearch
  | Joint
  | YoungC
  | YoungB
  | YoungA
  | Regional
  | KeyInternational
  | OrganizationInternational
  | MajorInstrument
  | InnovativeGroup
  | ExcellenceGroup
  | OriginalExplorationLong
  | SpecialLong
  | ExemptKind
  | NationalKeyRAndD
  | NationalMajorProgram
  | CasStrategicHighGround
  | NationalLaboratoryProgram

type project_tag =
  | NoSpecialTag
  | YoungScientist
  | SmeProject
  | InternationalCooperation
  | IntergovernmentalCooperation
  | StrategicHkMacaoTaiwanCooperation
  | DepartmentRecommended
  | ScientificInstrumentDirection

type project_role =
  | Applicant
  | Principal
  | Participant
  | TaskPrincipal
  | AcademicLeader
  | KeyMember
  | OtherResearcher

type project_status =
  | Applying
  | FormallyAccepted
  | UnderReview
  | Active
  | Withdrawn
  | RejectedAtInitialReview
  | NotFunded
  | Completed

type violation =
  | SameTypeApplicationLimit
  | PreviousYearSameTypeAwardLimit
  | SeniorTotalLimit
  | NonSeniorLeaderLimit
  | NonSeniorParticipantLimit
  | JointNationalProgramLimit
  | ScientificInstrumentJointLimit
  | MostConcurrentPrincipalApplicationLimit
  | ActiveNationalProjectPrincipalLimit
  | ActiveNationalTaskPrincipalLeadLimit
  | MostPersonnelTotalLimit
  | WithdrawnNationalProjectLimit

type review_reason =
  | MostGuideVersionRequired
  | NsfcSpecialRulesIncomplete

type decision = Allowed | Blocked | NeedsReview
