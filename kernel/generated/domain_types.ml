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

type project_role = Applicant | Principal | Participant

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

type decision = Allowed | Blocked
