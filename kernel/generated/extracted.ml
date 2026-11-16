
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

type project = { kind : Domain_types.project_kind;
                 role : Domain_types.project_role;
                 status : Domain_types.project_status; approval_year : 
                 int; direct_cost_wan : int;
                 title_at_approval : Domain_types.professional_title }

type profile =
  Domain_types.professional_title
  (* singleton inductive, whose constructor was mkProfile *)

(** val _UU9879__UU76ee__UU7c7b__UU522b__UU503c_ :
    project -> Domain_types.project_kind **)

let _UU9879__UU76ee__UU7c7b__UU522b__UU503c_ p =
  p.kind

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

(** val _UU76f4__UU63a5__UU8d39__UU7528__UU4e07__UU5143_ : project -> int **)

let _UU76f4__UU63a5__UU8d39__UU7528__UU4e07__UU5143_ p =
  p.direct_cost_wan

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

(** val _UU662f__UU7533__UU8bf7__UU4eba_ :
    Domain_types.project_role -> bool **)

let _UU662f__UU7533__UU8bf7__UU4eba_ = function
| Domain_types.Applicant -> true
| _ -> false

(** val _UU662f__UU8d1f__UU8d23__UU4eba_ :
    Domain_types.project_role -> bool **)

let _UU662f__UU8d1f__UU8d23__UU4eba_ = function
| Domain_types.Participant -> false
| _ -> true

(** val _UU662f__UU53c2__UU4e0e__UU8005_ :
    Domain_types.project_role -> bool **)

let _UU662f__UU53c2__UU4e0e__UU8005_ = function
| Domain_types.Participant -> true
| _ -> false

(** val _UU540c__UU7c7b__UU7533__UU8bf7__UU5e94__UU8ba1__UU6570_ :
    project -> project -> bool **)

let _UU540c__UU7c7b__UU7533__UU8bf7__UU5e94__UU8ba1__UU6570_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  match _UU9879__UU76ee__UU72b6__UU6001__UU503c_
          _UU5df2__UU6709__UU9879__UU76ee_ with
  | Domain_types.Applying ->
    (&&)
      (_UU662f__UU7533__UU8bf7__UU4eba_
        (_UU9879__UU76ee__UU89d2__UU8272__UU503c_
          _UU5df2__UU6709__UU9879__UU76ee_))
      (_UU9879__UU76ee__UU7c7b__UU522b__UU76f8__UU540c_
        (_UU9879__UU76ee__UU7c7b__UU522b__UU503c_
          _UU62df__UU7533__UU62a5__UU9879__UU76ee_)
        (_UU9879__UU76ee__UU7c7b__UU522b__UU503c_
          _UU5df2__UU6709__UU9879__UU76ee_))
  | _ -> false

(** val _UU5e74__UU4efd__UU9608__UU503c_2020 : int **)

let _UU5e74__UU4efd__UU9608__UU503c_2020 = 2020

(** val _UU5e74__UU4efd__UU9608__UU503c_2023 : int **)

let _UU5e74__UU4efd__UU9608__UU503c_2023 = 2023

(** val _UU8d39__UU7528__UU9608__UU503c_200_UU4e07__UU5143_ : int **)

let _UU8d39__UU7528__UU9608__UU503c_200_UU4e07__UU5143_ = 200

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

(** val _UU9879__UU76ee__UU5c5e__UU4e8e__UU603b__UU6570__UU8303__UU56f4_ :
    project -> bool **)

let _UU9879__UU76ee__UU5c5e__UU4e8e__UU603b__UU6570__UU8303__UU56f4_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  match _UU9879__UU76ee__UU7c7b__UU522b__UU503c_
          _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
  | Domain_types.OrganizationInternational ->
    (&&)
      (_UU8d39__UU7528__UU8d85__UU8fc7_200_UU4e07__UU5143_
        _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
      (_UU662f__UU8d1f__UU8d23__UU4eba_
        (_UU9879__UU76ee__UU89d2__UU8272__UU503c_
          _UU5f85__UU5224__UU65ad__UU9879__UU76ee_))
  | Domain_types.ExemptKind -> false
  | _ -> true

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

(** val _UU5e94__UU8ba1__UU5165__UU8d1f__UU8d23__UU4eba__UU603b__UU6570_ :
    profile -> project -> bool **)

let _UU5e94__UU8ba1__UU5165__UU8d1f__UU8d23__UU4eba__UU603b__UU6570_ _UU4eba__UU5458_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  (&&)
    ((&&)
      (_UU9879__UU76ee__UU5c5e__UU4e8e__UU603b__UU6570__UU8303__UU56f4_
        _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
      (match _UU9879__UU76ee__UU72b6__UU6001__UU503c_
               _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
       | Domain_types.Applying -> true
       | Domain_types.Active ->
         (match _UU9879__UU76ee__UU89d2__UU8272__UU503c_
                  _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
          | Domain_types.Participant ->
            _UU5728__UU7814__UU53c2__UU4e0e__UU9879__UU76ee__UU5e94__UU8ba1__UU6570_
              _UU4eba__UU5458_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_
          | _ -> true)
       | _ -> false))
    (_UU662f__UU8d1f__UU8d23__UU4eba_
      (_UU9879__UU76ee__UU89d2__UU8272__UU503c_
        _UU5f85__UU5224__UU65ad__UU9879__UU76ee_))

(** val _UU5e94__UU8ba1__UU5165__UU53c2__UU4e0e__UU8005__UU603b__UU6570_ :
    profile -> project -> bool **)

let _UU5e94__UU8ba1__UU5165__UU53c2__UU4e0e__UU8005__UU603b__UU6570_ _UU4eba__UU5458_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ =
  (&&)
    ((&&)
      (_UU9879__UU76ee__UU5c5e__UU4e8e__UU603b__UU6570__UU8303__UU56f4_
        _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
      (match _UU9879__UU76ee__UU72b6__UU6001__UU503c_
               _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
       | Domain_types.Applying -> true
       | Domain_types.Active ->
         (match _UU9879__UU76ee__UU89d2__UU8272__UU503c_
                  _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
          | Domain_types.Participant ->
            _UU5728__UU7814__UU53c2__UU4e0e__UU9879__UU76ee__UU5e94__UU8ba1__UU6570_
              _UU4eba__UU5458_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_
          | _ -> true)
       | _ -> false))
    (_UU662f__UU53c2__UU4e0e__UU8005_
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

(** val _UU540c__UU7c7b__UU7533__UU8bf7__UU603b__UU6570_ :
    project -> project list -> int **)

let _UU540c__UU7c7b__UU7533__UU8bf7__UU603b__UU6570_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  add
    (_UU6309__UU6761__UU4ef6__UU8ba1__UU6570_
      (_UU540c__UU7c7b__UU7533__UU8bf7__UU5e94__UU8ba1__UU6570_
        _UU62df__UU7533__UU62a5__UU9879__UU76ee_)
      _UU5df2__UU6709__UU9879__UU76ee_)
    (Stdlib.Int.succ 0)

(** val _UU9879__UU76ee__UU603b__UU6570_ :
    profile -> project -> project list -> int **)

let _UU9879__UU76ee__UU603b__UU6570_ _UU4eba__UU5458_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  add
    (_UU6309__UU6761__UU4ef6__UU8ba1__UU6570_
      (fun _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ ->
      (&&)
        (_UU9879__UU76ee__UU5c5e__UU4e8e__UU603b__UU6570__UU8303__UU56f4_
          _UU5f85__UU5224__UU65ad__UU9879__UU76ee_)
        (match _UU9879__UU76ee__UU72b6__UU6001__UU503c_
                 _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
         | Domain_types.Applying -> true
         | Domain_types.Active ->
           (match _UU9879__UU76ee__UU89d2__UU8272__UU503c_
                    _UU5f85__UU5224__UU65ad__UU9879__UU76ee_ with
            | Domain_types.Participant ->
              _UU5728__UU7814__UU53c2__UU4e0e__UU9879__UU76ee__UU5e94__UU8ba1__UU6570_
                _UU4eba__UU5458_ _UU5f85__UU5224__UU65ad__UU9879__UU76ee_
            | _ -> true)
         | _ -> false))
      _UU5df2__UU6709__UU9879__UU76ee_)
    (if (&&)
          (_UU9879__UU76ee__UU5c5e__UU4e8e__UU603b__UU6570__UU8303__UU56f4_
            _UU62df__UU7533__UU62a5__UU9879__UU76ee_)
          (match _UU9879__UU76ee__UU72b6__UU6001__UU503c_
                   _UU62df__UU7533__UU62a5__UU9879__UU76ee_ with
           | Domain_types.Applying -> true
           | Domain_types.Active ->
             (match _UU9879__UU76ee__UU89d2__UU8272__UU503c_
                      _UU62df__UU7533__UU62a5__UU9879__UU76ee_ with
              | Domain_types.Participant ->
                _UU5728__UU7814__UU53c2__UU4e0e__UU9879__UU76ee__UU5e94__UU8ba1__UU6570_
                  _UU4eba__UU5458_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_
              | _ -> true)
           | _ -> false)
     then Stdlib.Int.succ 0
     else 0)

(** val _UU8d1f__UU8d23__UU4eba__UU9879__UU76ee__UU603b__UU6570_ :
    profile -> project -> project list -> int **)

let _UU8d1f__UU8d23__UU4eba__UU9879__UU76ee__UU603b__UU6570_ _UU4eba__UU5458_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  add
    (_UU6309__UU6761__UU4ef6__UU8ba1__UU6570_
      (_UU5e94__UU8ba1__UU5165__UU8d1f__UU8d23__UU4eba__UU603b__UU6570_
        _UU4eba__UU5458_)
      _UU5df2__UU6709__UU9879__UU76ee_)
    (if _UU5e94__UU8ba1__UU5165__UU8d1f__UU8d23__UU4eba__UU603b__UU6570_
          _UU4eba__UU5458_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_
     then Stdlib.Int.succ 0
     else 0)

(** val _UU53c2__UU4e0e__UU8005__UU9879__UU76ee__UU603b__UU6570_ :
    profile -> project -> project list -> int **)

let _UU53c2__UU4e0e__UU8005__UU9879__UU76ee__UU603b__UU6570_ _UU4eba__UU5458_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  add
    (_UU6309__UU6761__UU4ef6__UU8ba1__UU6570_
      (_UU5e94__UU8ba1__UU5165__UU53c2__UU4e0e__UU8005__UU603b__UU6570_
        _UU4eba__UU5458_)
      _UU5df2__UU6709__UU9879__UU76ee_)
    (if _UU5e94__UU8ba1__UU5165__UU53c2__UU4e0e__UU8005__UU603b__UU6570_
          _UU4eba__UU5458_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_
     then Stdlib.Int.succ 0
     else 0)

(** val _UU8fdd__UU89c4__UU5217__UU8868_ :
    profile -> project -> project list -> Domain_types.violation list **)

let _UU8fdd__UU89c4__UU5217__UU8868_ _UU4eba__UU5458_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  let _UU540c__UU7c7b__UU7533__UU8bf7__UU8fdd__UU89c4_ =
    if (<=)
         (_UU540c__UU7c7b__UU7533__UU8bf7__UU603b__UU6570_
           _UU62df__UU7533__UU62a5__UU9879__UU76ee_
           _UU5df2__UU6709__UU9879__UU76ee_)
         (Stdlib.Int.succ 0)
    then []
    else Domain_types.SameTypeApplicationLimit :: []
  in
  let _UU603b__UU6570__UU8fdd__UU89c4_ =
    match _UU5f53__UU524d__UU804c__UU79f0_ _UU4eba__UU5458_ with
    | Domain_types.Senior ->
      if (<=)
           (_UU9879__UU76ee__UU603b__UU6570_ _UU4eba__UU5458_
             _UU62df__UU7533__UU62a5__UU9879__UU76ee_
             _UU5df2__UU6709__UU9879__UU76ee_)
           (Stdlib.Int.succ (Stdlib.Int.succ 0))
      then []
      else Domain_types.SeniorTotalLimit :: []
    | Domain_types.NonSenior ->
      app
        (if (<=)
              (_UU8d1f__UU8d23__UU4eba__UU9879__UU76ee__UU603b__UU6570_
                _UU4eba__UU5458_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_
                _UU5df2__UU6709__UU9879__UU76ee_)
              (Stdlib.Int.succ 0)
         then []
         else Domain_types.NonSeniorLeaderLimit :: [])
        (if (<=)
              (_UU53c2__UU4e0e__UU8005__UU9879__UU76ee__UU603b__UU6570_
                _UU4eba__UU5458_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_
                _UU5df2__UU6709__UU9879__UU76ee_)
              (Stdlib.Int.succ (Stdlib.Int.succ 0))
         then []
         else Domain_types.NonSeniorParticipantLimit :: [])
  in
  app _UU540c__UU7c7b__UU7533__UU8bf7__UU8fdd__UU89c4_
    _UU603b__UU6570__UU8fdd__UU89c4_

(** val _UU68c0__UU67e5_ :
    profile -> project -> project list -> Domain_types.decision **)

let _UU68c0__UU67e5_ _UU4eba__UU5458_ _UU62df__UU7533__UU62a5__UU9879__UU76ee_ _UU5df2__UU6709__UU9879__UU76ee_ =
  match _UU8fdd__UU89c4__UU5217__UU8868_ _UU4eba__UU5458_
          _UU62df__UU7533__UU62a5__UU9879__UU76ee_
          _UU5df2__UU6709__UU9879__UU76ee_ with
  | [] -> Domain_types.Allowed
  | _ :: _ -> Domain_types.Blocked

(** val same_type_application_count : project -> project list -> int **)

let same_type_application_count =
  _UU540c__UU7c7b__UU7533__UU8bf7__UU603b__UU6570_

(** val total_count : profile -> project -> project list -> int **)

let total_count =
  _UU9879__UU76ee__UU603b__UU6570_

(** val leader_count : profile -> project -> project list -> int **)

let leader_count =
  _UU8d1f__UU8d23__UU4eba__UU9879__UU76ee__UU603b__UU6570_

(** val participant_count : profile -> project -> project list -> int **)

let participant_count =
  _UU53c2__UU4e0e__UU8005__UU9879__UU76ee__UU603b__UU6570_

(** val violations :
    profile -> project -> project list -> Domain_types.violation list **)

let violations =
  _UU8fdd__UU89c4__UU5217__UU8868_

(** val check :
    profile -> project -> project list -> Domain_types.decision **)

let check =
  _UU68c0__UU67e5_
