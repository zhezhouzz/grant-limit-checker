open Js_of_ocaml
open Domain_types
open Extracted

let guide_of_int = function
  | 0 -> Some Nsfc2026
  | 1 -> Some Most2026LifeScience
  | 2 -> Some Most2026MathPhysicsAi
  | 3 -> Some MostGuideUnspecified
  | _ -> None

let kind_of_int = function
  | 0 -> Some General
  | 1 -> Some Key
  | 2 -> Some Major
  | 3 -> Some MajorResearch
  | 4 -> Some Joint
  | 5 -> Some YoungC
  | 6 -> Some YoungB
  | 7 -> Some YoungA
  | 8 -> Some Regional
  | 9 -> Some KeyInternational
  | 10 -> Some OrganizationInternational
  | 11 -> Some MajorInstrument
  | 12 -> Some InnovativeGroup
  | 13 -> Some ExcellenceGroup
  | 14 -> Some OriginalExplorationLong
  | 15 -> Some SpecialLong
  | 16 -> Some ExemptKind
  | 17 -> Some NationalKeyRAndD
  | 18 -> Some NationalMajorProgram
  | 19 -> Some CasStrategicHighGround
  | 20 -> Some NationalLaboratoryProgram
  | _ -> None

let tag_of_int = function
  | 0 -> Some NoSpecialTag
  | 1 -> Some YoungScientist
  | 2 -> Some SmeProject
  | 3 -> Some InternationalCooperation
  | 4 -> Some IntergovernmentalCooperation
  | 5 -> Some StrategicHkMacaoTaiwanCooperation
  | 6 -> Some DepartmentRecommended
  | 7 -> Some ScientificInstrumentDirection
  | _ -> None

let role_of_int = function
  | 0 -> Some Applicant
  | 1 -> Some Principal
  | 2 -> Some Participant
  | 3 -> Some TaskPrincipal
  | 4 -> Some AcademicLeader
  | 5 -> Some KeyMember
  | 6 -> Some OtherResearcher
  | _ -> None

let status_of_int = function
  | 0 -> Some Applying
  | 1 -> Some FormallyAccepted
  | 2 -> Some UnderReview
  | 3 -> Some Active
  | 4 -> Some Withdrawn
  | 5 -> Some RejectedAtInitialReview
  | 6 -> Some NotFunded
  | 7 -> Some Completed
  | _ -> None

let title_of_int = function 0 -> Some Senior | 1 -> Some NonSenior | _ -> None

let parse_int value = try Some (int_of_string value) with Failure _ -> None

let leap_year year = year mod 400 = 0 || (year mod 4 = 0 && year mod 100 <> 0)

let days_in_month year = function
  | 1 | 3 | 5 | 7 | 8 | 10 | 12 -> 31
  | 4 | 6 | 9 | 11 -> 30
  | 2 -> if leap_year year then 29 else 28
  | _ -> 0

let valid_date year month day =
  year >= 1900 && year <= 2200 && month >= 1 && month <= 12
  && day >= 1 && day <= days_in_month year month

let is_nsfc_kind = function
  | General | Key | Major | MajorResearch | Joint | YoungC | YoungB | YoungA
  | Regional | KeyInternational | OrganizationInternational | MajorInstrument
  | InnovativeGroup | ExcellenceGroup | OriginalExplorationLong | SpecialLong
  | ExemptKind -> true
  | _ -> false

let is_most_kind kind = not (is_nsfc_kind kind)

let guide_matches_kind guide kind =
  match guide with
  | Nsfc2026 -> is_nsfc_kind kind
  | Most2026LifeScience | Most2026MathPhysicsAi | MostGuideUnspecified ->
      is_most_kind kind

let valid_tag kind tag =
  match tag with
  | DepartmentRecommended -> kind = MajorInstrument
  | ScientificInstrumentDirection -> kind = NationalKeyRAndD
  | YoungScientist | SmeProject | InternationalCooperation
  | IntergovernmentalCooperation | StrategicHkMacaoTaiwanCooperation ->
      is_most_kind kind
  | NoSpecialTag -> true

let valid_role kind role =
  if is_nsfc_kind kind then
    match role with
    | Applicant | Principal | Participant -> true
    | TaskPrincipal -> kind = Major
    | AcademicLeader | KeyMember -> kind = InnovativeGroup || kind = ExcellenceGroup
    | OtherResearcher -> false
  else
    match role with
    | Principal | TaskPrincipal | KeyMember | OtherResearcher -> true
    | Applicant | Participant | AcademicLeader -> false

let valid_status_for_guide guide status =
  match guide, status with
  | Nsfc2026, Withdrawn -> false
  | _ -> true

let valid_role_status guide role status =
  match guide, status, role with
  | Nsfc2026, (Applying | FormallyAccepted | UnderReview
              | RejectedAtInitialReview | NotFunded), Principal -> false
  | Nsfc2026, (Active | Completed), Applicant -> false
  | _ -> true

let parse_project encoded =
  match String.split_on_char ',' encoded |> List.map parse_int with
  | [ Some k; Some guide_value; Some tag_value; Some r; Some s;
      Some approval_year; Some end_year; Some end_month; Some end_day;
      Some direct_cost_wan; Some central_budget_wan; Some t ]
    when approval_year >= 1900 && approval_year <= 2200
         && end_year >= approval_year
         && valid_date end_year end_month end_day
         && direct_cost_wan >= 0 && central_budget_wan >= 0 ->
      Option.bind (kind_of_int k) (fun kind ->
          Option.bind (guide_of_int guide_value) (fun guide ->
              Option.bind (tag_of_int tag_value) (fun tag ->
                  Option.bind (role_of_int r) (fun role ->
                      Option.bind (status_of_int s) (fun status ->
                          Option.bind (title_of_int t) (fun title_at_approval ->
                              if guide_matches_kind guide kind && valid_tag kind tag
                                 && valid_role kind role
                                 && valid_status_for_guide guide status
                                 && valid_role_status guide role status then
                                Some { guide; kind; tag; role; status; approval_year;
                                       end_year; end_month; end_day; direct_cost_wan;
                                       central_budget_wan; title_at_approval }
                              else None))))))
  | _ -> None

let rec parse_projects = function
  | [] -> Some []
  | "" :: rest -> parse_projects rest
  | encoded :: rest ->
      Option.bind (parse_project encoded) (fun project ->
          Option.map (fun projects -> project :: projects) (parse_projects rest))

let violation_code = function
  | SameTypeApplicationLimit -> "NSFC-2026-GENERAL-1"
  | PreviousYearSameTypeAwardLimit -> "NSFC-2026-GENERAL-2"
  | SeniorTotalLimit -> "NSFC-2026-TOTAL-SENIOR-2"
  | NonSeniorLeaderLimit -> "NSFC-2026-TOTAL-NONSENIOR-LEADER-1"
  | NonSeniorParticipantLimit -> "NSFC-2026-TOTAL-NONSENIOR-PARTICIPANT-2"
  | JointNationalProgramLimit -> "JOINT-2022-107-LIMIT-2"
  | ScientificInstrumentJointLimit -> "JOINT-2022-107-INSTRUMENT-LIMIT-1"
  | MostConcurrentPrincipalApplicationLimit -> "MOST-2026-PRINCIPAL-APPLICATION-LIMIT-1"
  | ActiveNationalProjectPrincipalLimit -> "MOST-2026-ACTIVE-PROJECT-PRINCIPAL"
  | ActiveNationalTaskPrincipalLeadLimit -> "MOST-2026-ACTIVE-TASK-PRINCIPAL-LEAD"
  | MostPersonnelTotalLimit -> "MOST-2026-PERSONNEL-TOTAL-2"
  | WithdrawnNationalProjectLimit -> "MOST-2026-WITHDRAWAL-ORIGINAL-TERM"

let review_code = function
  | MostGuideVersionRequired -> "REVIEW-MOST-GUIDE-VERSION"
  | NsfcSpecialRulesIncomplete -> "REVIEW-NSFC-SPECIAL-RULES"

let json_string_list values =
  values |> List.map (Printf.sprintf "%S") |> String.concat "," |> Printf.sprintf "[%s]"

let result_json who application_year candidate existing =
  let found = violations who application_year candidate existing in
  let reviews = review_reasons candidate in
  let decision =
    match check who application_year candidate existing with
    | Allowed -> "allowed"
    | Blocked -> "blocked"
    | NeedsReview -> "review"
  in
  Printf.sprintf
    {|{"ok":true,"decision":"%s","counts":{"sameType":%d,"total":%d,"leader":%d,"participant":%d,"joint":%d,"mostInternal":%d,"instrumentJoint":%d},"violations":%s,"reviews":%s}|}
    decision
    (same_type_application_count candidate existing)
    (total_count who application_year candidate existing)
    (leader_count who application_year candidate existing)
    (participant_count who application_year candidate existing)
    (joint_count who application_year candidate existing)
    (most_internal_count candidate existing)
    (instrument_joint_count who application_year candidate existing)
    (json_string_list (List.map violation_code found))
    (json_string_list (List.map review_code reviews))

let check_request title application_year candidate existing =
  match
    ( title_of_int title,
      parse_project candidate,
      parse_projects (String.split_on_char ';' existing) )
  with
  | Some who, Some candidate, Some existing
    when application_year = 2026 && candidate.status = Applying ->
      result_json who application_year candidate existing
  | _ ->
      {|{"ok":false,"decision":"invalid","counts":{"sameType":0,"total":0,"leader":0,"participant":0,"joint":0,"mostInternal":0,"instrumentJoint":0},"violations":["INVALID-NORMALIZED-INPUT"],"reviews":[]}|}

let () =
  Js.export "GrantLimitKernel"
    (object%js
       method check title application_year candidate existing =
         check_request title application_year (Js.to_string candidate) (Js.to_string existing)
         |> Js.string
    end)
