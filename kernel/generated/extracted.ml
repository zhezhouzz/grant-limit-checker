
(** val negb : bool -> bool **)

let negb = function
| true -> false
| false -> true

(** val app : 'a1 list -> 'a1 list -> 'a1 list **)

let rec app l m =
  match l with
  | [] -> m
  | a :: l1 -> a :: (app l1 m)

(** val add : int -> int -> int **)

let rec add = (+)

module Nat =
 struct
  (** val ltb : int -> int -> bool **)

  let ltb n m =
    (<=) (Stdlib.Int.succ n) m
 end

(** val existsb : ('a1 -> bool) -> 'a1 list -> bool **)

let rec existsb f = function
| [] -> false
| a :: l0 -> (||) (f a) (existsb f l0)

type project = { guide : Domain_types.guide_version;
                 kind : Domain_types.project_kind;
                 tag : Domain_types.project_tag;
                 role : Domain_types.project_role;
                 status : Domain_types.project_status; approval_year : 
                 int; end_year : int; end_month : int; end_day : int;
                 direct_cost_wan : int; central_budget_wan : int;
                 title_at_approval : Domain_types.professional_title }

type profile =
  Domain_types.professional_title
  (* singleton inductive, whose constructor was mkProfile *)

(** val _UU6307__UU5357__UU7248__UU672c__UU503c_ :
    project -> Domain_types.guide_version **)

let _UU6307__UU5357__UU7248__UU672c__UU503c_ p =
  p.guide

(** val _UU9879__UU76ee__UU7c7b__UU522b__UU503c_ :
    project -> Domain_types.project_kind **)

let _UU9879__UU76ee__UU7c7b__UU522b__UU503c_ p =
  p.kind

(** val _UU9879__UU76ee__UU6807__UU8bc6__UU503c_ :
    project -> Domain_types.project_tag **)

let _UU9879__UU76ee__UU6807__UU8bc6__UU503c_ p =
  p.tag

(** val _UU9879__UU76ee__UU89d2__UU8272__UU503c_ :
    project -> Domain_types.project_role **)

let _UU9879__UU76ee__UU89d2__UU8272__UU503c_ p =
  p.role

(** val _UU9879__UU76ee__UU72b6__UU6001__UU503c_ :
    project -> Domain_types.project_status **)

let _UU9879__UU76ee__UU72b6__UU6001__UU503c_ p =
  p.status

(** val _UU6279__UU51c6__UU5e74__UU4efd_ : project -> int **)

let _UU6279__UU51c6__UU5e74__UU4efd_ p =
  p.approval_year

(** val _UU6267__UU884c__UU671f__UU7ed3__UU675f__UU5e74__UU4efd_ :
    project -> int **)

let _UU6267__UU884c__UU671f__UU7ed3__UU675f__UU5e74__UU4efd_ p =
  p.end_year

(** val _UU6267__UU884c__UU671f__UU7ed3__UU675f__UU6708__UU4efd_ :
    project -> int **)

let _UU6267__UU884c__UU671f__UU7ed3__UU675f__UU6708__UU4efd_ p =
  p.end_month

(** val _UU6267__UU884c__UU671f__UU7ed3__UU675f__UU65e5_ : project -> int **)

let _UU6267__UU884c__UU671f__UU7ed3__UU675f__UU65e5_ p =
  p.end_day

(** val _UU76f4__UU63a5__UU8d39__UU7528__UU4e07__UU5143_ : project -> int **)

let _UU76f4__UU63a5__UU8d39__UU7528__UU4e07__UU5143_ p =
  p.direct_cost_wan

(** val _UU4e2d__UU592e__UU8d22__UU653f__UU4e13__UU9879__UU8d44__UU91d1__UU9884__UU7b97__UU4e07__UU5143_ :
    project -> int **)

let _UU4e2d__UU592e__UU8d22__UU653f__UU4e13__UU9879__UU8d44__UU91d1__UU9884__UU7b97__UU4e07__UU5143_ p =
  p.central_budget_wan

(** val _UU6279__UU51c6__UU65f6__UU804c__UU79f0_ :
    project -> Domain_types.professional_title **)

let _UU6279__UU51c6__UU65f6__UU804c__UU79f0_ p =
  p.title_at_approval

(** val _UU5f53__UU524d__UU804c__UU79f0_ :
    profile -> Domain_types.professional_title **)

let _UU5f53__UU524d__UU804c__UU79f0_ p =
  p

(** val _UU9879__UU76ee__UU7c7b__UU522b__UU76f8__UU540c_ :
    Domain_types.project_kind -> Domain_types.project_kind -> bool **)

let _UU9879__UU76ee__UU7c7b__UU522b__UU76f8__UU540c_ x y =
  match x with
  | Domain_types.General ->
    (match y with
     | Domain_types.General -> true
     | _ -> false)
  | Domain_types.Key -> (match y with
                         | Domain_types.Key -> true
                         | _ -> false)
  | Domain_types.Major ->
    (match y with
     | Domain_types.Major -> true
     | _ -> false)
  | Domain_types.MajorResearch ->
    (match y with
     | Domain_types.MajorResearch -> true
     | _ -> false)
  | Domain_types.Joint ->
    (match y with
     | Domain_types.Joint -> true
     | _ -> false)
  | Domain_types.YoungC ->
    (match y with
     | Domain_types.YoungC -> true
     | _ -> false)
  | Domain_types.YoungB ->
    (match y with
     | Domain_types.YoungB -> true
     | _ -> false)
  | Domain_types.YoungA ->
    (match y with
     | Domain_types.YoungA -> true
     | _ -> false)
  | Domain_types.Regional ->
    (match y with
     | Domain_types.Regional -> true
     | _ -> false)
  | Domain_types.KeyInternational ->
    (match y with
     | Domain_types.KeyInternational -> true
     | _ -> false)
  | Domain_types.OrganizationInternational ->
    (match y with
     | Domain_types.OrganizationInternational -> true
     | _ -> false)
  | Domain_types.MajorInstrument ->
    (match y with
     | Domain_types.MajorInstrument -> true
     | _ -> false)
  | Domain_types.InnovativeGroup ->
    (match y with
     | Domain_types.InnovativeGroup -> true
     | _ -> false)
  | Domain_types.ExcellenceGroup ->
    (match y with
     | Domain_types.ExcellenceGroup -> true
     | _ -> false)
  | Domain_types.OriginalExplorationLong ->
    (match y with
     | Domain_types.OriginalExplorationLong -> true
     | _ -> false)
  | Domain_types.SpecialLong ->
    (match y with
     | Domain_types.SpecialLong -> true
     | _ -> false)
  | Domain_types.ExemptKind ->
    (match y with
     | Domain_types.ExemptKind -> true
     | _ -> false)
  | Domain_types.NationalKeyRAndD ->
    (match y with
     | Domain_types.NationalKeyRAndD -> true
     | _ -> false)
  | Domain_types.NationalMajorProgram ->
    (match y with
     | Domain_types.NationalMajorProgram -> true
     | _ -> false)
  | Domain_types.CasStrategicHighGround ->
    (match y with
     | Domain_types.CasStrategicHighGround -> true
     | _ -> false)
  | Domain_types.NationalLaboratoryProgram ->
    (match y with
     | Domain_types.NationalLaboratoryProgram -> true
     | _ -> false)

(** val _UU662f__UU7533__UU8bf7__UU4eba_ :
    Domain_types.project_role -> bool **)

let _UU662f__UU7533__UU8bf7__UU4eba_ = function
| Domain_types.Applicant -> true
| _ -> false

(** val _UU662f__UU8d1f__UU8d23__UU4eba_ :
    Domain_types.project_role -> bool **)

let _UU662f__UU8d1f__UU8d23__UU4eba_ = function
| Domain_types.Applicant -> true
| Domain_types.Principal -> true
| _ -> false

(** val _UU662f__UU9879__UU76ee__UU8d1f__UU8d23__UU4eba__UU89d2__UU8272_ :
    Domain_types.project_role -> bool **)

let _UU662f__UU9879__UU76ee__UU8d1f__UU8d23__UU4eba__UU89d2__UU8272_ = function
| Domain_types.Principal -> true
| _ -> false

(** val _UU662f__UU9879__UU76ee__UU6216__UU8bfe__UU9898__UU8d1f__UU8d23__UU4eba_ :
    Domain_types.project_role -> bool **)

let _UU662f__UU9879__UU76ee__UU6216__UU8bfe__UU9898__UU8d1f__UU8d23__UU4eba_ = function
| Domain_types.Applicant -> true
| Domain_types.Principal -> true
| Domain_types.TaskPrincipal -> true
| _ -> false

(** val _UU662f__UU4e3b__UU8981__UU53c2__UU4e0e__UU8005_ :
    Domain_types.project_role -> bool **)

let _UU662f__UU4e3b__UU8981__UU53c2__UU4e0e__UU8005_ = function
| Domain_types.Participant -> true
| _ -> false

(** val _UU662f__UU5b66__UU672f__UU5e26__UU5934__UU4eba__UU6216__UU9aa8__UU5e72__UU6210__UU5458_ :
    Domain_types.project_role -> bool **)

let _UU662f__UU5b66__UU672f__UU5e26__UU5934__UU4eba__UU6216__UU9aa8__UU5e72__UU6210__UU5458_ = function
| Domain_types.Applicant -> true
| Domain_types.AcademicLeader -> true
| Domain_types.KeyMember -> true
| _ -> false

(** val _UU5e74__UU4efd__UU9608__UU503c_2020 : int **)

let _UU5e74__UU4efd__UU9608__UU503c_2020 = 2020

(** val _UU5e74__UU4efd__UU9608__UU503c_2023 : int **)

let _UU5e74__UU4efd__UU9608__UU503c_2023 = 2023

(** val _UU5e74__UU4efd__UU9608__UU503c_2024 : int **)

let _UU5e74__UU4efd__UU9608__UU503c_2024 = 2024

(** val _UU8d39__UU7528__UU9608__UU503c_200_UU4e07__UU5143_ : int **)

let _UU8d39__UU7528__UU9608__UU503c_200_UU4e07__UU5143_ = 200

(** val _UU9884__UU7b97__UU9608__UU503c_400_UU4e07__UU5143_ : int **)

let _UU9884__UU7b97__UU9608__UU503c_400_UU4e07__UU5143_ = 400

(** val _UU65e5__UU671f__UU65e9__UU4e8e_ :
    int -> int -> int -> project -> bool **)

let _UU65e5__UU671f__UU65e9__UU4e8e_ _UU5e74_ _UU6708_ _UU65e5_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  if Nat.ltb
       (_UU6267__UU884c__UU671f__UU7ed3__UU675f__UU5e74__UU4efd_
         _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
       _UU5e74_
  then true
  else if (=)
            (_UU6267__UU884c__UU671f__UU7ed3__UU675f__UU5e74__UU4efd_
              _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
            _UU5e74_
       then if Nat.ltb
                 (_UU6267__UU884c__UU671f__UU7ed3__UU675f__UU6708__UU4efd_
                   _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
                 _UU6708_
            then true
            else if (=)
                      (_UU6267__UU884c__UU671f__UU7ed3__UU675f__UU6708__UU4efd_
                        _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
                      _UU6708_
                 then Nat.ltb
                        (_UU6267__UU884c__UU671f__UU7ed3__UU675f__UU65e5_
                          _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
                        _UU65e5_
                 else false
       else false

(** val _UU6279__UU51c6__UU5e74__UU4efd__UU4e0d__UU65e9__UU4e8e_2020 :
    project -> bool **)

let _UU6279__UU51c6__UU5e74__UU4efd__UU4e0d__UU65e9__UU4e8e_2020 _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  (<=) _UU5e74__UU4efd__UU9608__UU503c_2020
    (_UU6279__UU51c6__UU5e74__UU4efd_
      _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)

(** val _UU6279__UU51c6__UU5e74__UU4efd__UU4e0d__UU65e9__UU4e8e_2023 :
    project -> bool **)

let _UU6279__UU51c6__UU5e74__UU4efd__UU4e0d__UU65e9__UU4e8e_2023 _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  (<=) _UU5e74__UU4efd__UU9608__UU503c_2023
    (_UU6279__UU51c6__UU5e74__UU4efd_
      _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)

(** val _UU8d39__UU7528__UU8d85__UU8fc7_200_UU4e07__UU5143_ :
    project -> bool **)

let _UU8d39__UU7528__UU8d85__UU8fc7_200_UU4e07__UU5143_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  Nat.ltb _UU8d39__UU7528__UU9608__UU503c_200_UU4e07__UU5143_
    (_UU76f4__UU63a5__UU8d39__UU7528__UU4e07__UU5143_
      _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)

(** val _UU4e2d__UU592e__UU8d22__UU653f__UU9884__UU7b97__UU4e0d__UU8d85__UU8fc7_400_UU4e07__UU5143_ :
    project -> bool **)

let _UU4e2d__UU592e__UU8d22__UU653f__UU9884__UU7b97__UU4e0d__UU8d85__UU8fc7_400_UU4e07__UU5143_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  (<=)
    (_UU4e2d__UU592e__UU8d22__UU653f__UU4e13__UU9879__UU8d44__UU91d1__UU9884__UU7b97__UU4e07__UU5143_
      _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
    _UU9884__UU7b97__UU9608__UU503c_400_UU4e07__UU5143_

(** val _UU7533__UU8bf7__UU5e74__UU5ea6__UU4ecd__UU5728__UU6267__UU884c__UU671f__UU5185_ :
    int -> project -> bool **)

let _UU7533__UU8bf7__UU5e74__UU5ea6__UU4ecd__UU5728__UU6267__UU884c__UU671f__UU5185_ _UU7533__UU8bf7__UU5e74__UU5ea6_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  Nat.ltb _UU7533__UU8bf7__UU5e74__UU5ea6_
    (_UU6267__UU884c__UU671f__UU7ed3__UU675f__UU5e74__UU4efd_
      _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)

(** val _UU79d1__UU6280__UU90e8_2026_UU622a__UU6b62__UU65e5__UU524d__UU7ed3__UU675f_ :
    project -> bool **)

let _UU79d1__UU6280__UU90e8_2026_UU622a__UU6b62__UU65e5__UU524d__UU7ed3__UU675f_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  _UU65e5__UU671f__UU65e9__UU4e8e_ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    0))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    0)))))))))))) (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
    0))))))))))))))))))))))))))))))) _UU5f85__UU5224__UU65ad__UU9879__UU76ee_

(** val _UU662f__UU57fa__UU91d1__UU59d4__UU6307__UU5357_ : project -> bool **)

let _UU662f__UU57fa__UU91d1__UU59d4__UU6307__UU5357_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  match _UU6307__UU5357__UU7248__UU672c__UU503c_
          _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
  | Domain_types.Nsfc2026 -> true
  | _ -> false

(** val _UU662f__UU5df2__UU660e__UU786e__UU79d1__UU6280__UU90e8_2026_UU6307__UU5357_ :
    project -> bool **)

let _UU662f__UU5df2__UU660e__UU786e__UU79d1__UU6280__UU90e8_2026_UU6307__UU5357_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  match _UU6307__UU5357__UU7248__UU672c__UU503c_
          _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
  | Domain_types.Nsfc2026 -> false
  | Domain_types.MostGuideUnspecified -> false
  | _ -> true

(** val _UU5c5e__UU4e8e__UU57fa__UU91d1__UU59d4__UU9879__UU76ee_ :
    project -> bool **)

let _UU5c5e__UU4e8e__UU57fa__UU91d1__UU59d4__UU9879__UU76ee_ =
  _UU662f__UU57fa__UU91d1__UU59d4__UU6307__UU5357_

(** val _UU5c5e__UU4e8e__UU56fd__UU5bb6__UU91cd__UU70b9__UU7814__UU53d1__UU6216__UU91cd__UU5927__UU4e13__UU9879_ :
    project -> bool **)

let _UU5c5e__UU4e8e__UU56fd__UU5bb6__UU91cd__UU70b9__UU7814__UU53d1__UU6216__UU91cd__UU5927__UU4e13__UU9879_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  match _UU9879__UU76ee__UU7c7b__UU522b__UU503c_
          _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
  | Domain_types.NationalKeyRAndD -> true
  | Domain_types.NationalMajorProgram -> true
  | _ -> false

(** val _UU5c5e__UU4e8e__UU5341__UU4e00__UU6708__UU6307__UU5357__UU6269__UU5c55__UU8ba1__UU5212_ :
    project -> bool **)

let _UU5c5e__UU4e8e__UU5341__UU4e00__UU6708__UU6307__UU5357__UU6269__UU5c55__UU8ba1__UU5212_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  match _UU9879__UU76ee__UU7c7b__UU522b__UU503c_
          _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
  | Domain_types.CasStrategicHighGround -> true
  | Domain_types.NationalLaboratoryProgram -> true
  | _ -> false

(** val _UU662f__UU7533__UU8bf7__UU9636__UU6bb5_ : project -> bool **)

let _UU662f__UU7533__UU8bf7__UU9636__UU6bb5_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  match _UU9879__UU76ee__UU72b6__UU6001__UU503c_
          _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
  | Domain_types.Applying -> true
  | Domain_types.FormallyAccepted -> true
  | Domain_types.UnderReview -> true
  | _ -> false

(** val _UU662f__UU83b7__UU8d44__UU52a9__UU8bb0__UU5f55_ : project -> bool **)

let _UU662f__UU83b7__UU8d44__UU52a9__UU8bb0__UU5f55_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  match _UU9879__UU76ee__UU72b6__UU6001__UU503c_
          _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
  | Domain_types.Active -> true
  | Domain_types.Withdrawn -> true
  | Domain_types.Completed -> true
  | _ -> false

(** val _UU540c__UU7c7b__UU7533__UU8bf7__UU89c4__UU5219__UU9002__UU7528_ :
    project -> bool **)

let _UU540c__UU7c7b__UU7533__UU8bf7__UU89c4__UU5219__UU9002__UU7528_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ =
  (&&)
    (_UU5c5e__UU4e8e__UU57fa__UU91d1__UU59d4__UU9879__UU76ee_
      _UU62df__UU7533__UU62a5__UU9879__UU76ee_)
    ((&&)
      (_UU662f__UU7533__UU8bf7__UU4eba_
        (_UU9879__UU76ee__UU89d2__UU8272__UU503c_
          _UU62df__UU7533__UU62a5__UU9879__UU76ee_))
      (match _UU9879__UU76ee__UU7c7b__UU522b__UU503c_
               _UU62df__UU7533__UU62a5__UU9879__UU76ee_ with
       | Domain_types.MajorResearch -> false
       | Domain_types.Joint -> false
       | Domain_types.ExemptKind -> false
       | _ -> true))

(** val _UU540c__UU7c7b__UU7533__UU8bf7__UU5e94__UU8ba1__UU6570_ :
    project -> project -> bool **)

let _UU540c__UU7c7b__UU7533__UU8bf7__UU5e94__UU8ba1__UU6570_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  (&&)
    (_UU540c__UU7c7b__UU7533__UU8bf7__UU89c4__UU5219__UU9002__UU7528_
      _UU62df__UU7533__UU62a5__UU9879__UU76ee_)
    ((&&)
      (_UU662f__UU7533__UU8bf7__UU9636__UU6bb5_
        _UU5df2__UU6709__UU9879__UU76ee_)
      ((&&)
        (_UU662f__UU7533__UU8bf7__UU4eba_
          (_UU9879__UU76ee__UU89d2__UU8272__UU503c_
            _UU5df2__UU6709__UU9879__UU76ee_))
        (_UU9879__UU76ee__UU7c7b__UU522b__UU76f8__UU540c_
          (_UU9879__UU76ee__UU7c7b__UU522b__UU503c_
            _UU62df__UU7533__UU62a5__UU9879__UU76ee_)
          (_UU9879__UU76ee__UU7c7b__UU522b__UU503c_
            _UU5df2__UU6709__UU9879__UU76ee_))))

(** val _UU4e0a__UU5e74__UU5ea6__UU83b7__UU8d44__UU52a9__UU9650__UU5236__UU9002__UU7528_ :
    project -> bool **)

let _UU4e0a__UU5e74__UU5ea6__UU83b7__UU8d44__UU52a9__UU9650__UU5236__UU9002__UU7528_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ =
  (&&)
    (_UU662f__UU7533__UU8bf7__UU4eba_
      (_UU9879__UU76ee__UU89d2__UU8272__UU503c_
        _UU62df__UU7533__UU62a5__UU9879__UU76ee_))
    (match _UU9879__UU76ee__UU7c7b__UU522b__UU503c_
             _UU62df__UU7533__UU62a5__UU9879__UU76ee_ with
     | Domain_types.General -> true
     | Domain_types.Major -> true
     | Domain_types.Regional -> true
     | _ -> false)

(** val _UU662f__UU4e0a__UU5e74__UU5ea6__UU540c__UU7c7b__UU83b7__UU8d44__UU52a9__UU9879__UU76ee_ :
    int -> project -> project -> bool **)

let _UU662f__UU4e0a__UU5e74__UU5ea6__UU540c__UU7c7b__UU83b7__UU8d44__UU52a9__UU9879__UU76ee_ _UU7533__UU8bf7__UU5e74__UU5ea6_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  (&&)
    (_UU4e0a__UU5e74__UU5ea6__UU83b7__UU8d44__UU52a9__UU9650__UU5236__UU9002__UU7528_
      _UU62df__UU7533__UU62a5__UU9879__UU76ee_)
    ((&&)
      (_UU9879__UU76ee__UU7c7b__UU522b__UU76f8__UU540c_
        (_UU9879__UU76ee__UU7c7b__UU522b__UU503c_
          _UU62df__UU7533__UU62a5__UU9879__UU76ee_)
        (_UU9879__UU76ee__UU7c7b__UU522b__UU503c_
          _UU5df2__UU6709__UU9879__UU76ee_))
      ((&&)
        (_UU662f__UU9879__UU76ee__UU8d1f__UU8d23__UU4eba__UU89d2__UU8272_
          (_UU9879__UU76ee__UU89d2__UU8272__UU503c_
            _UU5df2__UU6709__UU9879__UU76ee_))
        ((&&)
          (_UU662f__UU83b7__UU8d44__UU52a9__UU8bb0__UU5f55_
            _UU5df2__UU6709__UU9879__UU76ee_)
          ((=) (Stdlib.Int.succ
            (_UU6279__UU51c6__UU5e74__UU4efd_
              _UU5df2__UU6709__UU9879__UU76ee_))
            _UU7533__UU8bf7__UU5e74__UU5ea6_))))

(** val _UU4e0a__UU5e74__UU5ea6__UU83b7__UU8d44__UU52a9__UU540c__UU7c7b__UU9879__UU76ee__UU4e0d__UU5f97__UU7533__UU8bf7_ :
    int -> project -> project list -> bool **)

let _UU4e0a__UU5e74__UU5ea6__UU83b7__UU8d44__UU52a9__UU540c__UU7c7b__UU9879__UU76ee__UU4e0d__UU5f97__UU7533__UU8bf7_ _UU7533__UU8bf7__UU5e74__UU5ea6_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  existsb
    (_UU662f__UU4e0a__UU5e74__UU5ea6__UU540c__UU7c7b__UU83b7__UU8d44__UU52a9__UU9879__UU76ee_
      _UU7533__UU8bf7__UU5e74__UU5ea6_
      _UU62df__UU7533__UU62a5__UU9879__UU76ee_)
    _UU5df2__UU6709__UU9879__UU76ee_

(** val _UU9879__UU76ee__UU5c5e__UU4e8e__UU57fa__UU91d1__UU59d4__UU603b__UU6570__UU8303__UU56f4_ :
    project -> bool **)

let _UU9879__UU76ee__UU5c5e__UU4e8e__UU57fa__UU91d1__UU59d4__UU603b__UU6570__UU8303__UU56f4_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  match _UU9879__UU76ee__UU7c7b__UU522b__UU503c_
          _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
  | Domain_types.OrganizationInternational ->
    (&&)
      (_UU8d39__UU7528__UU8d85__UU8fc7_200_UU4e07__UU5143_
        _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
      (_UU662f__UU8d1f__UU8d23__UU4eba_
        (_UU9879__UU76ee__UU89d2__UU8272__UU503c_
          _UU5f85__UU5224__UU65ad__UU9879__UU76ee_))
  | Domain_types.InnovativeGroup ->
    Nat.ltb _UU5e74__UU4efd__UU9608__UU503c_2024
      (_UU6279__UU51c6__UU5e74__UU4efd_
        _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
  | Domain_types.ExemptKind -> false
  | Domain_types.NationalKeyRAndD -> false
  | Domain_types.NationalMajorProgram -> false
  | Domain_types.CasStrategicHighGround -> false
  | Domain_types.NationalLaboratoryProgram -> false
  | _ -> true

(** val _UU57fa__UU91d1__UU59d4__UU7533__UU8bf7__UU9636__UU6bb5__UU5e94__UU8ba1__UU5165__UU603b__UU6570_ :
    project -> bool **)

let _UU57fa__UU91d1__UU59d4__UU7533__UU8bf7__UU9636__UU6bb5__UU5e94__UU8ba1__UU5165__UU603b__UU6570_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  match _UU9879__UU76ee__UU7c7b__UU522b__UU503c_
          _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
  | Domain_types.YoungB ->
    (match _UU9879__UU76ee__UU72b6__UU6001__UU503c_
             _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
     | Domain_types.FormallyAccepted -> true
     | Domain_types.UnderReview -> true
     | _ -> false)
  | Domain_types.YoungA ->
    (match _UU9879__UU76ee__UU72b6__UU6001__UU503c_
             _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
     | Domain_types.FormallyAccepted -> true
     | Domain_types.UnderReview -> true
     | _ -> false)
  | Domain_types.InnovativeGroup ->
    (match _UU9879__UU76ee__UU72b6__UU6001__UU503c_
             _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
     | Domain_types.FormallyAccepted -> true
     | Domain_types.UnderReview -> true
     | _ -> false)
  | Domain_types.ExcellenceGroup ->
    (match _UU9879__UU76ee__UU72b6__UU6001__UU503c_
             _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
     | Domain_types.FormallyAccepted -> true
     | Domain_types.UnderReview -> true
     | _ -> false)
  | Domain_types.OriginalExplorationLong -> false
  | _ ->
    (match _UU9879__UU76ee__UU72b6__UU6001__UU503c_
             _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
     | Domain_types.Applying -> true
     | Domain_types.FormallyAccepted -> true
     | Domain_types.UnderReview -> true
     | _ -> false)

(** val _UU5728__UU7814__UU53c2__UU4e0e__UU9879__UU76ee__UU5e94__UU8ba1__UU6570_ :
    profile -> project -> bool **)

let _UU5728__UU7814__UU53c2__UU4e0e__UU9879__UU76ee__UU5e94__UU8ba1__UU6570_ _UU4eba__UU5458_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  match _UU5f53__UU524d__UU804c__UU79f0_ _UU4eba__UU5458_ with
  | Domain_types.Senior ->
    (match _UU6279__UU51c6__UU65f6__UU804c__UU79f0_
             _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
     | Domain_types.Senior ->
       _UU6279__UU51c6__UU5e74__UU4efd__UU4e0d__UU65e9__UU4e8e_2020
         _UU5f85__UU5224__UU65ad__UU9879__UU76ee_
     | Domain_types.NonSenior -> false)
  | Domain_types.NonSenior ->
    _UU6279__UU51c6__UU5e74__UU4efd__UU4e0d__UU65e9__UU4e8e_2023
      _UU5f85__UU5224__UU65ad__UU9879__UU76ee_

(** val _UU662f__UU57fa__UU91d1__UU59d4__UU8d1f__UU8d23__UU4eba__UU89d2__UU8272_ :
    Domain_types.project_role -> bool **)

let _UU662f__UU57fa__UU91d1__UU59d4__UU8d1f__UU8d23__UU4eba__UU89d2__UU8272_ = function
| Domain_types.Applicant -> true
| Domain_types.Principal -> true
| Domain_types.AcademicLeader -> true
| _ -> false

(** val _UU662f__UU57fa__UU91d1__UU59d4__UU53c2__UU4e0e__UU8005__UU89d2__UU8272_ :
    Domain_types.project_role -> bool **)

let _UU662f__UU57fa__UU91d1__UU59d4__UU53c2__UU4e0e__UU8005__UU89d2__UU8272_ = function
| Domain_types.Participant -> true
| Domain_types.KeyMember -> true
| _ -> false

(** val _UU9879__UU76ee__UU5e94__UU8ba1__UU5165__UU603b__UU6570_ :
    profile -> int -> project -> bool **)

let _UU9879__UU76ee__UU5e94__UU8ba1__UU5165__UU603b__UU6570_ _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  (&&)
    (_UU9879__UU76ee__UU5c5e__UU4e8e__UU57fa__UU91d1__UU59d4__UU603b__UU6570__UU8303__UU56f4_
      _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
    (match _UU9879__UU76ee__UU72b6__UU6001__UU503c_
             _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
     | Domain_types.Applying ->
       _UU57fa__UU91d1__UU59d4__UU7533__UU8bf7__UU9636__UU6bb5__UU5e94__UU8ba1__UU5165__UU603b__UU6570_
         _UU5f85__UU5224__UU65ad__UU9879__UU76ee_
     | Domain_types.FormallyAccepted ->
       _UU57fa__UU91d1__UU59d4__UU7533__UU8bf7__UU9636__UU6bb5__UU5e94__UU8ba1__UU5165__UU603b__UU6570_
         _UU5f85__UU5224__UU65ad__UU9879__UU76ee_
     | Domain_types.UnderReview ->
       _UU57fa__UU91d1__UU59d4__UU7533__UU8bf7__UU9636__UU6bb5__UU5e94__UU8ba1__UU5165__UU603b__UU6570_
         _UU5f85__UU5224__UU65ad__UU9879__UU76ee_
     | Domain_types.Active ->
       (&&)
         (_UU7533__UU8bf7__UU5e74__UU5ea6__UU4ecd__UU5728__UU6267__UU884c__UU671f__UU5185_
           _UU7533__UU8bf7__UU5e74__UU5ea6_
           _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
         (if _UU662f__UU57fa__UU91d1__UU59d4__UU8d1f__UU8d23__UU4eba__UU89d2__UU8272_
               (_UU9879__UU76ee__UU89d2__UU8272__UU503c_
                 _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
          then true
          else _UU5728__UU7814__UU53c2__UU4e0e__UU9879__UU76ee__UU5e94__UU8ba1__UU6570_
                 _UU4eba__UU5458_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
     | Domain_types.Withdrawn ->
       (&&)
         (_UU7533__UU8bf7__UU5e74__UU5ea6__UU4ecd__UU5728__UU6267__UU884c__UU671f__UU5185_
           _UU7533__UU8bf7__UU5e74__UU5ea6_
           _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
         (if _UU662f__UU57fa__UU91d1__UU59d4__UU8d1f__UU8d23__UU4eba__UU89d2__UU8272_
               (_UU9879__UU76ee__UU89d2__UU8272__UU503c_
                 _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
          then true
          else _UU5728__UU7814__UU53c2__UU4e0e__UU9879__UU76ee__UU5e94__UU8ba1__UU6570_
                 _UU4eba__UU5458_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
     | _ -> false)

(** val _UU5e94__UU8ba1__UU5165__UU8d1f__UU8d23__UU4eba__UU603b__UU6570_ :
    profile -> int -> project -> bool **)

let _UU5e94__UU8ba1__UU5165__UU8d1f__UU8d23__UU4eba__UU603b__UU6570_ _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  (&&)
    (_UU9879__UU76ee__UU5e94__UU8ba1__UU5165__UU603b__UU6570_
      _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_
      _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
    (_UU662f__UU57fa__UU91d1__UU59d4__UU8d1f__UU8d23__UU4eba__UU89d2__UU8272_
      (_UU9879__UU76ee__UU89d2__UU8272__UU503c_
        _UU5f85__UU5224__UU65ad__UU9879__UU76ee_))

(** val _UU5e94__UU8ba1__UU5165__UU53c2__UU4e0e__UU8005__UU603b__UU6570_ :
    profile -> int -> project -> bool **)

let _UU5e94__UU8ba1__UU5165__UU53c2__UU4e0e__UU8005__UU603b__UU6570_ _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  (&&)
    (_UU9879__UU76ee__UU5e94__UU8ba1__UU5165__UU603b__UU6570_
      _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_
      _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
    (_UU662f__UU57fa__UU91d1__UU59d4__UU53c2__UU4e0e__UU8005__UU89d2__UU8272_
      (_UU9879__UU76ee__UU89d2__UU8272__UU503c_
        _UU5f85__UU5224__UU65ad__UU9879__UU76ee_))

(** val _UU6309__UU6761__UU4ef6__UU8ba1__UU6570_ :
    (project -> bool) -> project list -> int **)

let rec _UU6309__UU6761__UU4ef6__UU8ba1__UU6570_ _UU6761__UU4ef6_ = function
| [] -> 0
| _UU5f53__UU524d__UU9879__UU76ee_ :: _UU5176__UU4f59__UU9879__UU76ee_ ->
  add
    (if _UU6761__UU4ef6_ _UU5f53__UU524d__UU9879__UU76ee_
     then Stdlib.Int.succ 0
     else 0)
    (_UU6309__UU6761__UU4ef6__UU8ba1__UU6570_ _UU6761__UU4ef6_
      _UU5176__UU4f59__UU9879__UU76ee_)

(** val _UU9879__UU76ee__UU603b__UU6570_ :
    profile -> int -> project -> project list -> int **)

let _UU9879__UU76ee__UU603b__UU6570_ _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  add
    (_UU6309__UU6761__UU4ef6__UU8ba1__UU6570_
      (_UU9879__UU76ee__UU5e94__UU8ba1__UU5165__UU603b__UU6570_
        _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_)
      _UU5df2__UU6709__UU9879__UU76ee_)
    (if _UU9879__UU76ee__UU5e94__UU8ba1__UU5165__UU603b__UU6570_
          _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_
          _UU62df__UU7533__UU62a5__UU9879__UU76ee_
     then Stdlib.Int.succ 0
     else 0)

(** val _UU8d1f__UU8d23__UU4eba__UU9879__UU76ee__UU603b__UU6570_ :
    profile -> int -> project -> project list -> int **)

let _UU8d1f__UU8d23__UU4eba__UU9879__UU76ee__UU603b__UU6570_ _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  add
    (_UU6309__UU6761__UU4ef6__UU8ba1__UU6570_
      (_UU5e94__UU8ba1__UU5165__UU8d1f__UU8d23__UU4eba__UU603b__UU6570_
        _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_)
      _UU5df2__UU6709__UU9879__UU76ee_)
    (if _UU5e94__UU8ba1__UU5165__UU8d1f__UU8d23__UU4eba__UU603b__UU6570_
          _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_
          _UU62df__UU7533__UU62a5__UU9879__UU76ee_
     then Stdlib.Int.succ 0
     else 0)

(** val _UU53c2__UU4e0e__UU8005__UU9879__UU76ee__UU603b__UU6570_ :
    profile -> int -> project -> project list -> int **)

let _UU53c2__UU4e0e__UU8005__UU9879__UU76ee__UU603b__UU6570_ _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  add
    (_UU6309__UU6761__UU4ef6__UU8ba1__UU6570_
      (_UU5e94__UU8ba1__UU5165__UU53c2__UU4e0e__UU8005__UU603b__UU6570_
        _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_)
      _UU5df2__UU6709__UU9879__UU76ee_)
    (if _UU5e94__UU8ba1__UU5165__UU53c2__UU4e0e__UU8005__UU603b__UU6570_
          _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_
          _UU62df__UU7533__UU62a5__UU9879__UU76ee_
     then Stdlib.Int.succ 0
     else 0)

(** val _UU79d1__UU6280__UU90e8__UU91cd__UU70b9__UU7814__UU53d1__UU6807__UU8bc6__UU7eb3__UU5165__UU8054__UU5408__UU9650__UU9879_ :
    project -> bool **)

let _UU79d1__UU6280__UU90e8__UU91cd__UU70b9__UU7814__UU53d1__UU6807__UU8bc6__UU7eb3__UU5165__UU8054__UU5408__UU9650__UU9879_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  match _UU9879__UU76ee__UU6807__UU8bc6__UU503c_
          _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
  | Domain_types.NoSpecialTag -> true
  | Domain_types.DepartmentRecommended -> true
  | Domain_types.ScientificInstrumentDirection -> true
  | _ -> false

(** val _UU79d1__UU6280__UU91cd__UU5927__UU4e13__UU9879__UU6807__UU8bc6__UU7eb3__UU5165__UU8054__UU5408__UU9650__UU9879_ :
    project -> bool **)

let _UU79d1__UU6280__UU91cd__UU5927__UU4e13__UU9879__UU6807__UU8bc6__UU7eb3__UU5165__UU8054__UU5408__UU9650__UU9879_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  match _UU9879__UU76ee__UU6807__UU8bc6__UU503c_
          _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
  | Domain_types.YoungScientist -> false
  | _ -> true

(** val _UU8054__UU5408__UU9650__UU9879__UU7c7b__UU522b__UU4e0e__UU89d2__UU8272__UU5339__UU914d_ :
    profile -> project -> bool **)

let _UU8054__UU5408__UU9650__UU9879__UU7c7b__UU522b__UU4e0e__UU89d2__UU8272__UU5339__UU914d_ _UU4eba__UU5458_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  match _UU9879__UU76ee__UU7c7b__UU522b__UU503c_
          _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
  | Domain_types.Major ->
    _UU662f__UU9879__UU76ee__UU6216__UU8bfe__UU9898__UU8d1f__UU8d23__UU4eba_
      (_UU9879__UU76ee__UU89d2__UU8272__UU503c_
        _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
  | Domain_types.MajorInstrument ->
    (&&)
      (match _UU9879__UU76ee__UU6807__UU8bc6__UU503c_
               _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
       | Domain_types.DepartmentRecommended -> true
       | _ -> false)
      ((||)
        (_UU662f__UU8d1f__UU8d23__UU4eba_
          (_UU9879__UU76ee__UU89d2__UU8272__UU503c_
            _UU5f85__UU5224__UU65ad__UU9879__UU76ee_))
        ((&&)
          (match _UU5f53__UU524d__UU804c__UU79f0_ _UU4eba__UU5458_ with
           | Domain_types.Senior -> true
           | Domain_types.NonSenior -> false)
          (_UU662f__UU4e3b__UU8981__UU53c2__UU4e0e__UU8005_
            (_UU9879__UU76ee__UU89d2__UU8272__UU503c_
              _UU5f85__UU5224__UU65ad__UU9879__UU76ee_))))
  | Domain_types.ExcellenceGroup ->
    _UU662f__UU5b66__UU672f__UU5e26__UU5934__UU4eba__UU6216__UU9aa8__UU5e72__UU6210__UU5458_
      (_UU9879__UU76ee__UU89d2__UU8272__UU503c_
        _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
  | Domain_types.NationalKeyRAndD ->
    (&&)
      (_UU79d1__UU6280__UU90e8__UU91cd__UU70b9__UU7814__UU53d1__UU6807__UU8bc6__UU7eb3__UU5165__UU8054__UU5408__UU9650__UU9879_
        _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
      (_UU662f__UU9879__UU76ee__UU6216__UU8bfe__UU9898__UU8d1f__UU8d23__UU4eba_
        (_UU9879__UU76ee__UU89d2__UU8272__UU503c_
          _UU5f85__UU5224__UU65ad__UU9879__UU76ee_))
  | Domain_types.NationalMajorProgram ->
    (&&)
      (_UU79d1__UU6280__UU91cd__UU5927__UU4e13__UU9879__UU6807__UU8bc6__UU7eb3__UU5165__UU8054__UU5408__UU9650__UU9879_
        _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
      (_UU662f__UU9879__UU76ee__UU6216__UU8bfe__UU9898__UU8d1f__UU8d23__UU4eba_
        (_UU9879__UU76ee__UU89d2__UU8272__UU503c_
          _UU5f85__UU5224__UU65ad__UU9879__UU76ee_))
  | _ -> false

(** val _UU4f9d__UU6307__UU5357__UU4ecd__UU5728__UU8054__UU5408__UU9650__UU9879__UU671f__UU5185_ :
    int -> project -> project -> bool **)

let _UU4f9d__UU6307__UU5357__UU4ecd__UU5728__UU8054__UU5408__UU9650__UU9879__UU671f__UU5185_ _UU7533__UU8bf7__UU5e74__UU5ea6_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  match _UU9879__UU76ee__UU72b6__UU6001__UU503c_
          _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
  | Domain_types.Applying -> true
  | Domain_types.FormallyAccepted -> true
  | Domain_types.UnderReview -> true
  | Domain_types.Active ->
    if _UU662f__UU5df2__UU660e__UU786e__UU79d1__UU6280__UU90e8_2026_UU6307__UU5357_
         _UU62df__UU7533__UU62a5__UU9879__UU76ee_
    then negb
           (_UU79d1__UU6280__UU90e8_2026_UU622a__UU6b62__UU65e5__UU524d__UU7ed3__UU675f_
             _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
    else _UU7533__UU8bf7__UU5e74__UU5ea6__UU4ecd__UU5728__UU6267__UU884c__UU671f__UU5185_
           _UU7533__UU8bf7__UU5e74__UU5ea6_
           _UU5f85__UU5224__UU65ad__UU9879__UU76ee_
  | Domain_types.Withdrawn ->
    if _UU662f__UU5df2__UU660e__UU786e__UU79d1__UU6280__UU90e8_2026_UU6307__UU5357_
         _UU62df__UU7533__UU62a5__UU9879__UU76ee_
    then negb
           (_UU79d1__UU6280__UU90e8_2026_UU622a__UU6b62__UU65e5__UU524d__UU7ed3__UU675f_
             _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
    else _UU7533__UU8bf7__UU5e74__UU5ea6__UU4ecd__UU5728__UU6267__UU884c__UU671f__UU5185_
           _UU7533__UU8bf7__UU5e74__UU5ea6_
           _UU5f85__UU5224__UU65ad__UU9879__UU76ee_
  | _ -> false

(** val _UU9879__UU76ee__UU5e94__UU8ba1__UU5165__UU8054__UU5408__UU9650__UU9879_ :
    profile -> int -> project -> project -> bool **)

let _UU9879__UU76ee__UU5e94__UU8ba1__UU5165__UU8054__UU5408__UU9650__UU9879_ _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  (&&)
    (_UU4f9d__UU6307__UU5357__UU4ecd__UU5728__UU8054__UU5408__UU9650__UU9879__UU671f__UU5185_
      _UU7533__UU8bf7__UU5e74__UU5ea6_
      _UU62df__UU7533__UU62a5__UU9879__UU76ee_
      _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
    (_UU8054__UU5408__UU9650__UU9879__UU7c7b__UU522b__UU4e0e__UU89d2__UU8272__UU5339__UU914d_
      _UU4eba__UU5458_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)

(** val _UU8054__UU5408__UU9650__UU9879__UU9879__UU76ee__UU603b__UU6570_ :
    profile -> int -> project -> project list -> int **)

let _UU8054__UU5408__UU9650__UU9879__UU9879__UU76ee__UU603b__UU6570_ _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  add
    (_UU6309__UU6761__UU4ef6__UU8ba1__UU6570_
      (_UU9879__UU76ee__UU5e94__UU8ba1__UU5165__UU8054__UU5408__UU9650__UU9879_
        _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_
        _UU62df__UU7533__UU62a5__UU9879__UU76ee_)
      _UU5df2__UU6709__UU9879__UU76ee_)
    (if _UU9879__UU76ee__UU5e94__UU8ba1__UU5165__UU8054__UU5408__UU9650__UU9879_
          _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_
          _UU62df__UU7533__UU62a5__UU9879__UU76ee_
          _UU62df__UU7533__UU62a5__UU9879__UU76ee_
     then Stdlib.Int.succ 0
     else 0)

(** val _UU662f__UU79d1__UU5b66__UU4eea__UU5668__UU8054__UU5408__UU9650__UU9879__UU9879__UU76ee_ :
    project -> bool **)

let _UU662f__UU79d1__UU5b66__UU4eea__UU5668__UU8054__UU5408__UU9650__UU9879__UU9879__UU76ee_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  match _UU9879__UU76ee__UU7c7b__UU522b__UU503c_
          _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
  | Domain_types.MajorInstrument -> true
  | Domain_types.NationalKeyRAndD ->
    (match _UU9879__UU76ee__UU6807__UU8bc6__UU503c_
             _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
     | Domain_types.ScientificInstrumentDirection -> true
     | _ -> false)
  | _ -> false

(** val _UU79d1__UU5b66__UU4eea__UU5668__UU8054__UU5408__UU9650__UU9879__UU603b__UU6570_ :
    profile -> int -> project -> project list -> int **)

let _UU79d1__UU5b66__UU4eea__UU5668__UU8054__UU5408__UU9650__UU9879__UU603b__UU6570_ _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  match _UU5f53__UU524d__UU804c__UU79f0_ _UU4eba__UU5458_ with
  | Domain_types.Senior ->
    add
      (_UU6309__UU6761__UU4ef6__UU8ba1__UU6570_ (fun p ->
        (&&)
          (_UU662f__UU79d1__UU5b66__UU4eea__UU5668__UU8054__UU5408__UU9650__UU9879__UU9879__UU76ee_
            p)
          (_UU4f9d__UU6307__UU5357__UU4ecd__UU5728__UU8054__UU5408__UU9650__UU9879__UU671f__UU5185_
            _UU7533__UU8bf7__UU5e74__UU5ea6_
            _UU62df__UU7533__UU62a5__UU9879__UU76ee_ p))
        _UU5df2__UU6709__UU9879__UU76ee_)
      (if (&&)
            (_UU662f__UU79d1__UU5b66__UU4eea__UU5668__UU8054__UU5408__UU9650__UU9879__UU9879__UU76ee_
              _UU62df__UU7533__UU62a5__UU9879__UU76ee_)
            (_UU4f9d__UU6307__UU5357__UU4ecd__UU5728__UU8054__UU5408__UU9650__UU9879__UU671f__UU5185_
              _UU7533__UU8bf7__UU5e74__UU5ea6_
              _UU62df__UU7533__UU62a5__UU9879__UU76ee_
              _UU62df__UU7533__UU62a5__UU9879__UU76ee_)
       then Stdlib.Int.succ 0
       else 0)
  | Domain_types.NonSenior -> 0

(** val _UU79d1__UU6280__UU90e8__UU8d1f__UU8d23__UU4eba__UU7533__UU62a5__UU5e94__UU8ba1__UU6570_ :
    project -> bool **)

let _UU79d1__UU6280__UU90e8__UU8d1f__UU8d23__UU4eba__UU7533__UU62a5__UU5e94__UU8ba1__UU6570_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  (&&)
    (_UU5c5e__UU4e8e__UU56fd__UU5bb6__UU91cd__UU70b9__UU7814__UU53d1__UU6216__UU91cd__UU5927__UU4e13__UU9879_
      _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
    ((&&)
      (_UU662f__UU7533__UU8bf7__UU9636__UU6bb5_
        _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
      (_UU662f__UU9879__UU76ee__UU6216__UU8bfe__UU9898__UU8d1f__UU8d23__UU4eba_
        (_UU9879__UU76ee__UU89d2__UU8272__UU503c_
          _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)))

(** val _UU79d1__UU6280__UU90e8__UU540c__UU671f__UU8d1f__UU8d23__UU4eba__UU7533__UU62a5__UU603b__UU6570_ :
    project -> project list -> int **)

let _UU79d1__UU6280__UU90e8__UU540c__UU671f__UU8d1f__UU8d23__UU4eba__UU7533__UU62a5__UU603b__UU6570_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  add
    (_UU6309__UU6761__UU4ef6__UU8ba1__UU6570_
      _UU79d1__UU6280__UU90e8__UU8d1f__UU8d23__UU4eba__UU7533__UU62a5__UU5e94__UU8ba1__UU6570_
      _UU5df2__UU6709__UU9879__UU76ee_)
    (if _UU79d1__UU6280__UU90e8__UU8d1f__UU8d23__UU4eba__UU7533__UU62a5__UU5e94__UU8ba1__UU6570_
          _UU62df__UU7533__UU62a5__UU9879__UU76ee_
     then Stdlib.Int.succ 0
     else 0)

(** val _UU662f__UU5728__UU7814__UU56fd__UU5bb6__UU79d1__UU6280__UU8ba1__UU5212__UU9879__UU76ee__UU8d1f__UU8d23__UU4eba_ :
    project -> bool **)

let _UU662f__UU5728__UU7814__UU56fd__UU5bb6__UU79d1__UU6280__UU8ba1__UU5212__UU9879__UU76ee__UU8d1f__UU8d23__UU4eba_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  (&&)
    (_UU5c5e__UU4e8e__UU56fd__UU5bb6__UU91cd__UU70b9__UU7814__UU53d1__UU6216__UU91cd__UU5927__UU4e13__UU9879_
      _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
    ((&&)
      (_UU662f__UU9879__UU76ee__UU8d1f__UU8d23__UU4eba__UU89d2__UU8272_
        (_UU9879__UU76ee__UU89d2__UU8272__UU503c_
          _UU5f85__UU5224__UU65ad__UU9879__UU76ee_))
      ((&&)
        (match _UU9879__UU76ee__UU72b6__UU6001__UU503c_
                 _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
         | Domain_types.Active -> true
         | _ -> false)
        (negb
          (_UU79d1__UU6280__UU90e8_2026_UU622a__UU6b62__UU65e5__UU524d__UU7ed3__UU675f_
            _UU5f85__UU5224__UU65ad__UU9879__UU76ee_))))

(** val _UU5728__UU7814__UU56fd__UU5bb6__UU79d1__UU6280__UU8ba1__UU5212__UU9879__UU76ee__UU8d1f__UU8d23__UU4eba__UU4e0d__UU5f97__UU518d__UU6b21__UU7533__UU62a5_ :
    project -> project list -> bool **)

let _UU5728__UU7814__UU56fd__UU5bb6__UU79d1__UU6280__UU8ba1__UU5212__UU9879__UU76ee__UU8d1f__UU8d23__UU4eba__UU4e0d__UU5f97__UU518d__UU6b21__UU7533__UU62a5_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  (&&)
    (_UU662f__UU5df2__UU660e__UU786e__UU79d1__UU6280__UU90e8_2026_UU6307__UU5357_
      _UU62df__UU7533__UU62a5__UU9879__UU76ee_)
    ((&&)
      (_UU5c5e__UU4e8e__UU56fd__UU5bb6__UU91cd__UU70b9__UU7814__UU53d1__UU6216__UU91cd__UU5927__UU4e13__UU9879_
        _UU62df__UU7533__UU62a5__UU9879__UU76ee_)
      (existsb
        _UU662f__UU5728__UU7814__UU56fd__UU5bb6__UU79d1__UU6280__UU8ba1__UU5212__UU9879__UU76ee__UU8d1f__UU8d23__UU4eba_
        _UU5df2__UU6709__UU9879__UU76ee_))

(** val _UU5728__UU7814__UU8bfe__UU9898__UU8d1f__UU8d23__UU4eba__UU4e0d__UU5f97__UU518d__UU6b21__UU7275__UU5934_ :
    project -> project list -> bool **)

let _UU5728__UU7814__UU8bfe__UU9898__UU8d1f__UU8d23__UU4eba__UU4e0d__UU5f97__UU518d__UU6b21__UU7275__UU5934_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  (&&)
    (_UU662f__UU5df2__UU660e__UU786e__UU79d1__UU6280__UU90e8_2026_UU6307__UU5357_
      _UU62df__UU7533__UU62a5__UU9879__UU76ee_)
    ((&&)
      (_UU662f__UU9879__UU76ee__UU6216__UU8bfe__UU9898__UU8d1f__UU8d23__UU4eba_
        (_UU9879__UU76ee__UU89d2__UU8272__UU503c_
          _UU62df__UU7533__UU62a5__UU9879__UU76ee_))
      (existsb (fun p ->
        (&&)
          (_UU5c5e__UU4e8e__UU56fd__UU5bb6__UU91cd__UU70b9__UU7814__UU53d1__UU6216__UU91cd__UU5927__UU4e13__UU9879_
            p)
          ((&&)
            (match _UU9879__UU76ee__UU89d2__UU8272__UU503c_ p with
             | Domain_types.TaskPrincipal -> true
             | _ -> false)
            ((&&)
              (match _UU9879__UU76ee__UU72b6__UU6001__UU503c_ p with
               | Domain_types.Active -> true
               | _ -> false)
              (negb
                (_UU79d1__UU6280__UU90e8_2026_UU622a__UU6b62__UU65e5__UU524d__UU7ed3__UU675f_
                  p)))))
        _UU5df2__UU6709__UU9879__UU76ee_))

(** val _UU79d1__UU6280__UU90e8__UU5c0f__UU989d__UU56fd__UU9645__UU5408__UU4f5c__UU4e0d__UU8ba1__UU5185__UU90e8__UU603b__UU6570_ :
    project -> bool **)

let _UU79d1__UU6280__UU90e8__UU5c0f__UU989d__UU56fd__UU9645__UU5408__UU4f5c__UU4e0d__UU8ba1__UU5185__UU90e8__UU603b__UU6570_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  (&&)
    (_UU4e2d__UU592e__UU8d22__UU653f__UU9884__UU7b97__UU4e0d__UU8d85__UU8fc7_400_UU4e07__UU5143_
      _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
    (match _UU9879__UU76ee__UU6807__UU8bc6__UU503c_
             _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
     | Domain_types.IntergovernmentalCooperation -> true
     | Domain_types.StrategicHkMacaoTaiwanCooperation -> true
     | _ -> false)

(** val _UU79d1__UU6280__UU90e8__UU6307__UU5357__UU7c7b__UU522b__UU7eb3__UU5165__UU5185__UU90e8__UU603b__UU6570_ :
    project -> project -> bool **)

let _UU79d1__UU6280__UU90e8__UU6307__UU5357__UU7c7b__UU522b__UU7eb3__UU5165__UU5185__UU90e8__UU603b__UU6570_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  (||)
    (_UU5c5e__UU4e8e__UU56fd__UU5bb6__UU91cd__UU70b9__UU7814__UU53d1__UU6216__UU91cd__UU5927__UU4e13__UU9879_
      _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
    ((&&)
      (match _UU6307__UU5357__UU7248__UU672c__UU503c_
               _UU62df__UU7533__UU62a5__UU9879__UU76ee_ with
       | Domain_types.Most2026MathPhysicsAi -> true
       | _ -> false)
      (_UU5c5e__UU4e8e__UU5341__UU4e00__UU6708__UU6307__UU5357__UU6269__UU5c55__UU8ba1__UU5212_
        _UU5f85__UU5224__UU65ad__UU9879__UU76ee_))

(** val _UU9879__UU76ee__UU5e94__UU8ba1__UU5165__UU79d1__UU6280__UU90e8__UU5185__UU90e8__UU603b__UU6570_ :
    project -> project -> bool **)

let _UU9879__UU76ee__UU5e94__UU8ba1__UU5165__UU79d1__UU6280__UU90e8__UU5185__UU90e8__UU603b__UU6570_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  (&&)
    (_UU79d1__UU6280__UU90e8__UU6307__UU5357__UU7c7b__UU522b__UU7eb3__UU5165__UU5185__UU90e8__UU603b__UU6570_
      _UU62df__UU7533__UU62a5__UU9879__UU76ee_
      _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
    ((&&)
      (match _UU6307__UU5357__UU7248__UU672c__UU503c_
               _UU62df__UU7533__UU62a5__UU9879__UU76ee_ with
       | Domain_types.Most2026LifeScience ->
         (match _UU9879__UU76ee__UU89d2__UU8272__UU503c_
                  _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
          | Domain_types.Participant -> false
          | Domain_types.AcademicLeader -> false
          | Domain_types.OtherResearcher -> false
          | _ -> true)
       | Domain_types.Most2026MathPhysicsAi ->
         (match _UU9879__UU76ee__UU89d2__UU8272__UU503c_
                  _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
          | Domain_types.Participant -> false
          | Domain_types.AcademicLeader -> false
          | _ -> true)
       | _ -> false)
      ((&&)
        (negb
          (_UU79d1__UU6280__UU90e8__UU5c0f__UU989d__UU56fd__UU9645__UU5408__UU4f5c__UU4e0d__UU8ba1__UU5185__UU90e8__UU603b__UU6570_
            _UU5f85__UU5224__UU65ad__UU9879__UU76ee_))
        ((&&)
          (match _UU9879__UU76ee__UU72b6__UU6001__UU503c_
                   _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
           | Domain_types.Withdrawn ->
             (match _UU9879__UU76ee__UU89d2__UU8272__UU503c_
                      _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
              | Domain_types.OtherResearcher -> false
              | _ -> true)
           | _ -> true)
          (_UU4f9d__UU6307__UU5357__UU4ecd__UU5728__UU8054__UU5408__UU9650__UU9879__UU671f__UU5185_
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ (Stdlib.Int.succ (Stdlib.Int.succ
            (Stdlib.Int.succ
            0))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
            _UU62df__UU7533__UU62a5__UU9879__UU76ee_
            _UU5f85__UU5224__UU65ad__UU9879__UU76ee_))))

(** val _UU79d1__UU6280__UU90e8__UU5185__UU90e8__UU9879__UU76ee__UU603b__UU6570_ :
    project -> project list -> int **)

let _UU79d1__UU6280__UU90e8__UU5185__UU90e8__UU9879__UU76ee__UU603b__UU6570_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  add
    (_UU6309__UU6761__UU4ef6__UU8ba1__UU6570_
      (_UU9879__UU76ee__UU5e94__UU8ba1__UU5165__UU79d1__UU6280__UU90e8__UU5185__UU90e8__UU603b__UU6570_
        _UU62df__UU7533__UU62a5__UU9879__UU76ee_)
      _UU5df2__UU6709__UU9879__UU76ee_)
    (if _UU9879__UU76ee__UU5e94__UU8ba1__UU5165__UU79d1__UU6280__UU90e8__UU5185__UU90e8__UU603b__UU6570_
          _UU62df__UU7533__UU62a5__UU9879__UU76ee_
          _UU62df__UU7533__UU62a5__UU9879__UU76ee_
     then Stdlib.Int.succ 0
     else 0)

(** val _UU9000__UU51fa__UU56fd__UU5bb6__UU79d1__UU6280__UU8ba1__UU5212__UU6267__UU884c__UU671f__UU5185__UU4e0d__UU5f97__UU7533__UU62a5_ :
    project -> project list -> bool **)

let _UU9000__UU51fa__UU56fd__UU5bb6__UU79d1__UU6280__UU8ba1__UU5212__UU6267__UU884c__UU671f__UU5185__UU4e0d__UU5f97__UU7533__UU62a5_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  (&&)
    (_UU662f__UU5df2__UU660e__UU786e__UU79d1__UU6280__UU90e8_2026_UU6307__UU5357_
      _UU62df__UU7533__UU62a5__UU9879__UU76ee_)
    (existsb (fun p ->
      (&&)
        (_UU5c5e__UU4e8e__UU56fd__UU5bb6__UU91cd__UU70b9__UU7814__UU53d1__UU6216__UU91cd__UU5927__UU4e13__UU9879_
          p)
        ((&&)
          (match _UU9879__UU76ee__UU72b6__UU6001__UU503c_ p with
           | Domain_types.Withdrawn -> true
           | _ -> false)
          ((&&)
            (match _UU9879__UU76ee__UU89d2__UU8272__UU503c_ p with
             | Domain_types.Principal -> true
             | Domain_types.TaskPrincipal -> true
             | Domain_types.KeyMember -> true
             | _ -> false)
            (negb
              (_UU79d1__UU6280__UU90e8_2026_UU622a__UU6b62__UU65e5__UU524d__UU7ed3__UU675f_
                p)))))
      _UU5df2__UU6709__UU9879__UU76ee_)

(** val _UU57fa__UU91d1__UU59d4__UU7279__UU6b8a__UU89c4__UU5219__UU9700__UU8981__UU590d__UU6838_ :
    project -> bool **)

let _UU57fa__UU91d1__UU59d4__UU7279__UU6b8a__UU89c4__UU5219__UU9700__UU8981__UU590d__UU6838_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ =
  (&&)
    (_UU5c5e__UU4e8e__UU57fa__UU91d1__UU59d4__UU9879__UU76ee_
      _UU62df__UU7533__UU62a5__UU9879__UU76ee_)
    (match _UU9879__UU76ee__UU7c7b__UU522b__UU503c_
             _UU62df__UU7533__UU62a5__UU9879__UU76ee_ with
     | Domain_types.General -> false
     | Domain_types.Major -> false
     | _ -> true)

(** val _UU590d__UU6838__UU539f__UU56e0__UU5217__UU8868_ :
    project -> Domain_types.review_reason list **)

let _UU590d__UU6838__UU539f__UU56e0__UU5217__UU8868_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ =
  app
    (match _UU6307__UU5357__UU7248__UU672c__UU503c_
             _UU62df__UU7533__UU62a5__UU9879__UU76ee_ with
     | Domain_types.MostGuideUnspecified ->
       Domain_types.MostGuideVersionRequired :: []
     | _ -> [])
    (if _UU57fa__UU91d1__UU59d4__UU7279__UU6b8a__UU89c4__UU5219__UU9700__UU8981__UU590d__UU6838_
          _UU62df__UU7533__UU62a5__UU9879__UU76ee_
     then Domain_types.NsfcSpecialRulesIncomplete :: []
     else [])

(** val _UU540c__UU7c7b__UU7533__UU8bf7__UU8fdd__UU89c4__UU5217__UU8868_ :
    project -> project list -> Domain_types.violation list **)

let _UU540c__UU7c7b__UU7533__UU8bf7__UU8fdd__UU89c4__UU5217__UU8868_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  if _UU540c__UU7c7b__UU7533__UU8bf7__UU89c4__UU5219__UU9002__UU7528_
       _UU62df__UU7533__UU62a5__UU9879__UU76ee_
  then if (<=)
            (let _UU8ba1__UU6570_ =
               let rec _UU8ba1__UU6570_ = function
               | [] -> 0
               | _UU5f53__UU524d__UU9879__UU76ee_ :: _UU5176__UU4f59__UU9879__UU76ee_ ->
                 add
                   (if _UU540c__UU7c7b__UU7533__UU8bf7__UU5e94__UU8ba1__UU6570_
                         _UU62df__UU7533__UU62a5__UU9879__UU76ee_
                         _UU5f53__UU524d__UU9879__UU76ee_
                    then Stdlib.Int.succ 0
                    else 0)
                   (_UU8ba1__UU6570_ _UU5176__UU4f59__UU9879__UU76ee_)
               in _UU8ba1__UU6570_
             in
             if _UU540c__UU7c7b__UU7533__UU8bf7__UU89c4__UU5219__UU9002__UU7528_
                  _UU62df__UU7533__UU62a5__UU9879__UU76ee_
             then add (_UU8ba1__UU6570_ _UU5df2__UU6709__UU9879__UU76ee_)
                    (Stdlib.Int.succ 0)
             else 0)
            (Stdlib.Int.succ 0)
       then []
       else Domain_types.SameTypeApplicationLimit :: []
  else []

(** val _UU4e0a__UU5e74__UU5ea6__UU83b7__UU8d44__UU52a9__UU8fdd__UU89c4__UU5217__UU8868_ :
    int -> project -> project list -> Domain_types.violation list **)

let _UU4e0a__UU5e74__UU5ea6__UU83b7__UU8d44__UU52a9__UU8fdd__UU89c4__UU5217__UU8868_ _UU7533__UU8bf7__UU5e74__UU5ea6_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  if _UU4e0a__UU5e74__UU5ea6__UU83b7__UU8d44__UU52a9__UU540c__UU7c7b__UU9879__UU76ee__UU4e0d__UU5f97__UU7533__UU8bf7_
       _UU7533__UU8bf7__UU5e74__UU5ea6_
       _UU62df__UU7533__UU62a5__UU9879__UU76ee_
       _UU5df2__UU6709__UU9879__UU76ee_
  then Domain_types.PreviousYearSameTypeAwardLimit :: []
  else []

(** val _UU57fa__UU91d1__UU59d4__UU603b__UU6570__UU8fdd__UU89c4__UU5217__UU8868_ :
    profile -> int -> project -> project list -> Domain_types.violation list **)

let _UU57fa__UU91d1__UU59d4__UU603b__UU6570__UU8fdd__UU89c4__UU5217__UU8868_ _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  if _UU5c5e__UU4e8e__UU57fa__UU91d1__UU59d4__UU9879__UU76ee_
       _UU62df__UU7533__UU62a5__UU9879__UU76ee_
  then (match _UU5f53__UU524d__UU804c__UU79f0_ _UU4eba__UU5458_ with
        | Domain_types.Senior ->
          if (<=)
               (_UU9879__UU76ee__UU603b__UU6570_ _UU4eba__UU5458_
                 _UU7533__UU8bf7__UU5e74__UU5ea6_
                 _UU62df__UU7533__UU62a5__UU9879__UU76ee_
                 _UU5df2__UU6709__UU9879__UU76ee_)
               (Stdlib.Int.succ (Stdlib.Int.succ 0))
          then []
          else Domain_types.SeniorTotalLimit :: []
        | Domain_types.NonSenior ->
          app
            (if (<=)
                  (_UU8d1f__UU8d23__UU4eba__UU9879__UU76ee__UU603b__UU6570_
                    _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_
                    _UU62df__UU7533__UU62a5__UU9879__UU76ee_
                    _UU5df2__UU6709__UU9879__UU76ee_)
                  (Stdlib.Int.succ 0)
             then []
             else Domain_types.NonSeniorLeaderLimit :: [])
            (if (<=)
                  (_UU53c2__UU4e0e__UU8005__UU9879__UU76ee__UU603b__UU6570_
                    _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_
                    _UU62df__UU7533__UU62a5__UU9879__UU76ee_
                    _UU5df2__UU6709__UU9879__UU76ee_)
                  (Stdlib.Int.succ (Stdlib.Int.succ 0))
             then []
             else Domain_types.NonSeniorParticipantLimit :: []))
  else []

(** val _UU8054__UU5408__UU9650__UU9879__UU8fdd__UU89c4__UU5217__UU8868_ :
    profile -> int -> project -> project list -> Domain_types.violation list **)

let _UU8054__UU5408__UU9650__UU9879__UU8fdd__UU89c4__UU5217__UU8868_ _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  if _UU9879__UU76ee__UU5e94__UU8ba1__UU5165__UU8054__UU5408__UU9650__UU9879_
       _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_
       _UU62df__UU7533__UU62a5__UU9879__UU76ee_
       _UU62df__UU7533__UU62a5__UU9879__UU76ee_
  then if (<=)
            (_UU8054__UU5408__UU9650__UU9879__UU9879__UU76ee__UU603b__UU6570_
              _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_
              _UU62df__UU7533__UU62a5__UU9879__UU76ee_
              _UU5df2__UU6709__UU9879__UU76ee_)
            (Stdlib.Int.succ (Stdlib.Int.succ 0))
       then []
       else Domain_types.JointNationalProgramLimit :: []
  else []

(** val _UU79d1__UU5b66__UU4eea__UU5668__UU8054__UU5408__UU9650__UU9879__UU8fdd__UU89c4__UU5217__UU8868_ :
    profile -> int -> project -> project list -> Domain_types.violation list **)

let _UU79d1__UU5b66__UU4eea__UU5668__UU8054__UU5408__UU9650__UU9879__UU8fdd__UU89c4__UU5217__UU8868_ _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  if _UU662f__UU79d1__UU5b66__UU4eea__UU5668__UU8054__UU5408__UU9650__UU9879__UU9879__UU76ee_
       _UU62df__UU7533__UU62a5__UU9879__UU76ee_
  then if (<=)
            (_UU79d1__UU5b66__UU4eea__UU5668__UU8054__UU5408__UU9650__UU9879__UU603b__UU6570_
              _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_
              _UU62df__UU7533__UU62a5__UU9879__UU76ee_
              _UU5df2__UU6709__UU9879__UU76ee_)
            (Stdlib.Int.succ 0)
       then []
       else Domain_types.ScientificInstrumentJointLimit :: []
  else []

(** val _UU79d1__UU6280__UU90e8__UU540c__UU671f__UU8d1f__UU8d23__UU4eba__UU7533__UU62a5__UU8fdd__UU89c4__UU5217__UU8868_ :
    project -> project list -> Domain_types.violation list **)

let _UU79d1__UU6280__UU90e8__UU540c__UU671f__UU8d1f__UU8d23__UU4eba__UU7533__UU62a5__UU8fdd__UU89c4__UU5217__UU8868_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  if (&&)
       (_UU662f__UU5df2__UU660e__UU786e__UU79d1__UU6280__UU90e8_2026_UU6307__UU5357_
         _UU62df__UU7533__UU62a5__UU9879__UU76ee_)
       (_UU79d1__UU6280__UU90e8__UU8d1f__UU8d23__UU4eba__UU7533__UU62a5__UU5e94__UU8ba1__UU6570_
         _UU62df__UU7533__UU62a5__UU9879__UU76ee_)
  then if (<=)
            (_UU79d1__UU6280__UU90e8__UU540c__UU671f__UU8d1f__UU8d23__UU4eba__UU7533__UU62a5__UU603b__UU6570_
              _UU62df__UU7533__UU62a5__UU9879__UU76ee_
              _UU5df2__UU6709__UU9879__UU76ee_)
            (Stdlib.Int.succ 0)
       then []
       else Domain_types.MostConcurrentPrincipalApplicationLimit :: []
  else []

(** val _UU5728__UU7814__UU9879__UU76ee__UU8d1f__UU8d23__UU4eba__UU8fdd__UU89c4__UU5217__UU8868_ :
    project -> project list -> Domain_types.violation list **)

let _UU5728__UU7814__UU9879__UU76ee__UU8d1f__UU8d23__UU4eba__UU8fdd__UU89c4__UU5217__UU8868_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  if _UU5728__UU7814__UU56fd__UU5bb6__UU79d1__UU6280__UU8ba1__UU5212__UU9879__UU76ee__UU8d1f__UU8d23__UU4eba__UU4e0d__UU5f97__UU518d__UU6b21__UU7533__UU62a5_
       _UU62df__UU7533__UU62a5__UU9879__UU76ee_
       _UU5df2__UU6709__UU9879__UU76ee_
  then Domain_types.ActiveNationalProjectPrincipalLimit :: []
  else []

(** val _UU5728__UU7814__UU8bfe__UU9898__UU8d1f__UU8d23__UU4eba__UU8fdd__UU89c4__UU5217__UU8868_ :
    project -> project list -> Domain_types.violation list **)

let _UU5728__UU7814__UU8bfe__UU9898__UU8d1f__UU8d23__UU4eba__UU8fdd__UU89c4__UU5217__UU8868_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  if _UU5728__UU7814__UU8bfe__UU9898__UU8d1f__UU8d23__UU4eba__UU4e0d__UU5f97__UU518d__UU6b21__UU7275__UU5934_
       _UU62df__UU7533__UU62a5__UU9879__UU76ee_
       _UU5df2__UU6709__UU9879__UU76ee_
  then Domain_types.ActiveNationalTaskPrincipalLeadLimit :: []
  else []

(** val _UU79d1__UU6280__UU90e8__UU5185__UU90e8__UU603b__UU6570__UU8fdd__UU89c4__UU5217__UU8868_ :
    project -> project list -> Domain_types.violation list **)

let _UU79d1__UU6280__UU90e8__UU5185__UU90e8__UU603b__UU6570__UU8fdd__UU89c4__UU5217__UU8868_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  if (&&)
       (_UU662f__UU5df2__UU660e__UU786e__UU79d1__UU6280__UU90e8_2026_UU6307__UU5357_
         _UU62df__UU7533__UU62a5__UU9879__UU76ee_)
       (_UU9879__UU76ee__UU5e94__UU8ba1__UU5165__UU79d1__UU6280__UU90e8__UU5185__UU90e8__UU603b__UU6570_
         _UU62df__UU7533__UU62a5__UU9879__UU76ee_
         _UU62df__UU7533__UU62a5__UU9879__UU76ee_)
  then if (<=)
            (_UU79d1__UU6280__UU90e8__UU5185__UU90e8__UU9879__UU76ee__UU603b__UU6570_
              _UU62df__UU7533__UU62a5__UU9879__UU76ee_
              _UU5df2__UU6709__UU9879__UU76ee_)
            (Stdlib.Int.succ (Stdlib.Int.succ 0))
       then []
       else Domain_types.MostPersonnelTotalLimit :: []
  else []

(** val _UU9000__UU51fa__UU9879__UU76ee__UU8fdd__UU89c4__UU5217__UU8868_ :
    project -> project list -> Domain_types.violation list **)

let _UU9000__UU51fa__UU9879__UU76ee__UU8fdd__UU89c4__UU5217__UU8868_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  if _UU9000__UU51fa__UU56fd__UU5bb6__UU79d1__UU6280__UU8ba1__UU5212__UU6267__UU884c__UU671f__UU5185__UU4e0d__UU5f97__UU7533__UU62a5_
       _UU62df__UU7533__UU62a5__UU9879__UU76ee_
       _UU5df2__UU6709__UU9879__UU76ee_
  then Domain_types.WithdrawnNationalProjectLimit :: []
  else []

(** val _UU8fdd__UU89c4__UU5217__UU8868_ :
    profile -> int -> project -> project list -> Domain_types.violation list **)

let _UU8fdd__UU89c4__UU5217__UU8868_ _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  app
    (_UU540c__UU7c7b__UU7533__UU8bf7__UU8fdd__UU89c4__UU5217__UU8868_
      _UU62df__UU7533__UU62a5__UU9879__UU76ee_
      _UU5df2__UU6709__UU9879__UU76ee_)
    (app
      (_UU4e0a__UU5e74__UU5ea6__UU83b7__UU8d44__UU52a9__UU8fdd__UU89c4__UU5217__UU8868_
        _UU7533__UU8bf7__UU5e74__UU5ea6_
        _UU62df__UU7533__UU62a5__UU9879__UU76ee_
        _UU5df2__UU6709__UU9879__UU76ee_)
      (app
        (_UU57fa__UU91d1__UU59d4__UU603b__UU6570__UU8fdd__UU89c4__UU5217__UU8868_
          _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_
          _UU62df__UU7533__UU62a5__UU9879__UU76ee_
          _UU5df2__UU6709__UU9879__UU76ee_)
        (app
          (_UU8054__UU5408__UU9650__UU9879__UU8fdd__UU89c4__UU5217__UU8868_
            _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_
            _UU62df__UU7533__UU62a5__UU9879__UU76ee_
            _UU5df2__UU6709__UU9879__UU76ee_)
          (app
            (_UU79d1__UU5b66__UU4eea__UU5668__UU8054__UU5408__UU9650__UU9879__UU8fdd__UU89c4__UU5217__UU8868_
              _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_
              _UU62df__UU7533__UU62a5__UU9879__UU76ee_
              _UU5df2__UU6709__UU9879__UU76ee_)
            (app
              (_UU79d1__UU6280__UU90e8__UU540c__UU671f__UU8d1f__UU8d23__UU4eba__UU7533__UU62a5__UU8fdd__UU89c4__UU5217__UU8868_
                _UU62df__UU7533__UU62a5__UU9879__UU76ee_
                _UU5df2__UU6709__UU9879__UU76ee_)
              (app
                (_UU5728__UU7814__UU9879__UU76ee__UU8d1f__UU8d23__UU4eba__UU8fdd__UU89c4__UU5217__UU8868_
                  _UU62df__UU7533__UU62a5__UU9879__UU76ee_
                  _UU5df2__UU6709__UU9879__UU76ee_)
                (app
                  (_UU5728__UU7814__UU8bfe__UU9898__UU8d1f__UU8d23__UU4eba__UU8fdd__UU89c4__UU5217__UU8868_
                    _UU62df__UU7533__UU62a5__UU9879__UU76ee_
                    _UU5df2__UU6709__UU9879__UU76ee_)
                  (app
                    (_UU79d1__UU6280__UU90e8__UU5185__UU90e8__UU603b__UU6570__UU8fdd__UU89c4__UU5217__UU8868_
                      _UU62df__UU7533__UU62a5__UU9879__UU76ee_
                      _UU5df2__UU6709__UU9879__UU76ee_)
                    (_UU9000__UU51fa__UU9879__UU76ee__UU8fdd__UU89c4__UU5217__UU8868_
                      _UU62df__UU7533__UU62a5__UU9879__UU76ee_
                      _UU5df2__UU6709__UU9879__UU76ee_)))))))))

(** val _UU68c0__UU67e5_ :
    profile -> int -> project -> project list -> Domain_types.decision **)

let _UU68c0__UU67e5_ _UU4eba__UU5458_ _UU7533__UU8bf7__UU5e74__UU5ea6_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  match _UU8fdd__UU89c4__UU5217__UU8868_ _UU4eba__UU5458_
          _UU7533__UU8bf7__UU5e74__UU5ea6_
          _UU62df__UU7533__UU62a5__UU9879__UU76ee_
          _UU5df2__UU6709__UU9879__UU76ee_ with
  | [] ->
    (match _UU590d__UU6838__UU539f__UU56e0__UU5217__UU8868_
             _UU62df__UU7533__UU62a5__UU9879__UU76ee_ with
     | [] -> Domain_types.Allowed
     | _ :: _ -> Domain_types.NeedsReview)
  | _ :: _ -> Domain_types.Blocked

(** val same_type_application_count : project -> project list -> int **)

let same_type_application_count _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  let _UU8ba1__UU6570_ =
    let rec _UU8ba1__UU6570_ = function
    | [] -> 0
    | _UU5f53__UU524d__UU9879__UU76ee_ :: _UU5176__UU4f59__UU9879__UU76ee_ ->
      add
        (if _UU540c__UU7c7b__UU7533__UU8bf7__UU5e94__UU8ba1__UU6570_
              _UU62df__UU7533__UU62a5__UU9879__UU76ee_
              _UU5f53__UU524d__UU9879__UU76ee_
         then Stdlib.Int.succ 0
         else 0)
        (_UU8ba1__UU6570_ _UU5176__UU4f59__UU9879__UU76ee_)
    in _UU8ba1__UU6570_
  in
  if _UU540c__UU7c7b__UU7533__UU8bf7__UU89c4__UU5219__UU9002__UU7528_
       _UU62df__UU7533__UU62a5__UU9879__UU76ee_
  then add (_UU8ba1__UU6570_ _UU5df2__UU6709__UU9879__UU76ee_)
         (Stdlib.Int.succ 0)
  else 0

(** val total_count : profile -> int -> project -> project list -> int **)

let total_count =
  _UU9879__UU76ee__UU603b__UU6570_

(** val leader_count : profile -> int -> project -> project list -> int **)

let leader_count =
  _UU8d1f__UU8d23__UU4eba__UU9879__UU76ee__UU603b__UU6570_

(** val participant_count :
    profile -> int -> project -> project list -> int **)

let participant_count =
  _UU53c2__UU4e0e__UU8005__UU9879__UU76ee__UU603b__UU6570_

(** val joint_count : profile -> int -> project -> project list -> int **)

let joint_count =
  _UU8054__UU5408__UU9650__UU9879__UU9879__UU76ee__UU603b__UU6570_

(** val most_internal_count : project -> project list -> int **)

let most_internal_count =
  _UU79d1__UU6280__UU90e8__UU5185__UU90e8__UU9879__UU76ee__UU603b__UU6570_

(** val instrument_joint_count :
    profile -> int -> project -> project list -> int **)

let instrument_joint_count =
  _UU79d1__UU5b66__UU4eea__UU5668__UU8054__UU5408__UU9650__UU9879__UU603b__UU6570_

(** val violations :
    profile -> int -> project -> project list -> Domain_types.violation list **)

let violations =
  _UU8fdd__UU89c4__UU5217__UU8868_

(** val review_reasons : project -> Domain_types.review_reason list **)

let review_reasons =
  _UU590d__UU6838__UU539f__UU56e0__UU5217__UU8868_

(** val check :
    profile -> int -> project -> project list -> Domain_types.decision **)

let check =
  _UU68c0__UU67e5_
