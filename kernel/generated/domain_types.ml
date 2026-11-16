type professional_title = Senior | NonSenior

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

type project_tag =
  | NoSpecialTag
  | YoungScientist
  | SmeProject
  | InternationalCooperation
  | DepartmentRecommended

type project_role =
  | Applicant
  | Principal
  | Participant
  | TaskPrincipal
  | AcademicLeader
  | KeyMember

type project_status =
  | Applying
  | Active
  | EndsInApplicationYear
  | RejectedAtInitialReview
  | Completed

type violation =
  | SameTypeApplicationLimit
  | SeniorTotalLimit
  | NonSeniorLeaderLimit
  | NonSeniorParticipantLimit
  | JointNationalProgramLimit

type decision = Allowed | Blocked
