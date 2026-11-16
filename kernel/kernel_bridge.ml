open Js_of_ocaml
open Domain_types
open Extracted

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
  | _ -> None

let tag_of_int = function
  | 0 -> Some NoSpecialTag
  | 1 -> Some YoungScientist
  | 2 -> Some SmeProject
  | 3 -> Some InternationalCooperation
  | 4 -> Some DepartmentRecommended
  | _ -> None

let role_of_int = function
  | 0 -> Some Applicant
  | 1 -> Some Principal
  | 2 -> Some Participant
  | 3 -> Some TaskPrincipal
  | 4 -> Some AcademicLeader
  | 5 -> Some KeyMember
  | _ -> None

let status_of_int = function
  | 0 -> Some Applying
  | 1 -> Some Active
  | 2 -> Some RejectedAtInitialReview
  | 3 -> Some Completed
  | _ -> None

let title_of_int = function 0 -> Some Senior | 1 -> Some NonSenior | _ -> None

let parse_int value = try Some (int_of_string value) with Failure _ -> None

let parse_project encoded =
  match String.split_on_char ',' encoded |> List.map parse_int with
  | [ Some k; Some tag_value; Some r; Some s; Some approval_year; Some end_year;
      Some direct_cost_wan; Some t ]
    when approval_year >= 1900 && approval_year <= 2200
         && end_year >= approval_year && end_year <= 2200 && direct_cost_wan >= 0 ->
      Option.bind (kind_of_int k) (fun kind ->
          Option.bind (tag_of_int tag_value) (fun tag ->
              Option.bind (role_of_int r) (fun role ->
                  Option.bind (status_of_int s) (fun status ->
                      Option.map
                        (fun title_at_approval ->
                          { kind; tag; role; status; approval_year; end_year;
                            direct_cost_wan; title_at_approval })
                        (title_of_int t)))))
  | _ -> None

let rec parse_projects = function
  | [] -> Some []
  | "" :: rest -> parse_projects rest
  | encoded :: rest ->
      Option.bind (parse_project encoded) (fun project ->
          Option.map (fun projects -> project :: projects) (parse_projects rest))

let violation_code = function
  | SameTypeApplicationLimit -> "NSFC-2026-GENERAL-1"
  | SeniorTotalLimit -> "NSFC-2026-TOTAL-SENIOR-2"
  | NonSeniorLeaderLimit -> "NSFC-2026-TOTAL-NONSENIOR-LEADER-1"
  | NonSeniorParticipantLimit -> "NSFC-2026-TOTAL-NONSENIOR-PARTICIPANT-2"
  | JointNationalProgramLimit -> "JOINT-2022-107-LIMIT-2"
  | ActiveNationalProjectPrincipalLimit -> "MOST-2026-ACTIVE-PROJECT-PRINCIPAL"

let json_string_list values =
  values |> List.map (Printf.sprintf "%S") |> String.concat "," |> Printf.sprintf "[%s]"

let result_json who application_year candidate existing =
  let found = violations who application_year candidate existing in
  let decision = match check who application_year candidate existing with Allowed -> "allowed" | Blocked -> "blocked" in
  Printf.sprintf
    {|{"ok":true,"decision":"%s","counts":{"sameType":%d,"total":%d,"leader":%d,"participant":%d,"joint":%d},"violations":%s}|}
    decision
    (same_type_application_count candidate existing)
    (total_count who application_year candidate existing)
    (leader_count who application_year candidate existing)
    (participant_count who application_year candidate existing)
    (joint_count who application_year candidate existing)
    (json_string_list (List.map violation_code found))

let check_request title application_year candidate existing =
  match
    ( title_of_int title,
      parse_project candidate,
      parse_projects (String.split_on_char ';' existing) )
  with
  | Some who, Some candidate, Some existing
    when application_year >= 1900 && application_year <= 2200 ->
      result_json who application_year candidate existing
  | _ ->
      {|{"ok":false,"decision":"invalid","counts":{"sameType":0,"total":0,"leader":0,"participant":0,"joint":0},"violations":["INVALID-NORMALIZED-INPUT"]}|}

let () =
  Js.export "GrantLimitKernel"
    (object%js
       method check title application_year candidate existing =
         check_request title application_year (Js.to_string candidate) (Js.to_string existing)
         |> Js.string
    end)
