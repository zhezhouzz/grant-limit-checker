
val app : 'a1 list -> 'a1 list -> 'a1 list

val add : int -> int -> int

module Nat :
 sig
  val ltb : int -> int -> bool
 end

type project = { kind : Domain_types.project_kind;
                 tag : Domain_types.project_tag;
                 role : Domain_types.project_role;
                 status : Domain_types.project_status; approval_year : 
                 int; direct_cost_wan : int;
                 title_at_approval : Domain_types.professional_title }

type profile =
  Domain_types.professional_title
  (* singleton inductive, whose constructor was mkProfile *)

val _UU9879__UU76ee__UU7c7b__UU522b__UU503c_ :
  project -> Domain_types.project_kind

val _UU9879__UU76ee__UU6807__UU8bc6__UU503c_ :
  project -> Domain_types.project_tag

val _UU9879__UU76ee__UU89d2__UU8272__UU503c_ :
  project -> Domain_types.project_role

val _UU9879__UU76ee__UU72b6__UU6001__UU503c_ :
  project -> Domain_types.project_status

val _UU6279__UU51c6__UU5e74__UU4efd_ : project -> int

val _UU76f4__UU63a5__UU8d39__UU7528__UU4e07__UU5143_ : project -> int

val _UU6279__UU51c6__UU65f6__UU804c__UU79f0_ :
  project -> Domain_types.professional_title

val _UU5f53__UU524d__UU804c__UU79f0_ :
  profile -> Domain_types.professional_title

val _UU9879__UU76ee__UU7c7b__UU522b__UU76f8__UU540c_ :
  Domain_types.project_kind -> Domain_types.project_kind -> bool

val _UU662f__UU7533__UU8bf7__UU4eba_ : Domain_types.project_role -> bool

val _UU662f__UU8d1f__UU8d23__UU4eba_ : Domain_types.project_role -> bool

val _UU662f__UU53c2__UU4e0e__UU8005_ : Domain_types.project_role -> bool

val _UU662f__UU9879__UU76ee__UU6216__UU8bfe__UU9898__UU8d1f__UU8d23__UU4eba_ :
  Domain_types.project_role -> bool

val _UU662f__UU5b66__UU672f__UU5e26__UU5934__UU4eba__UU6216__UU9aa8__UU5e72__UU6210__UU5458_ :
  Domain_types.project_role -> bool

val _UU5c5e__UU4e8e__UU57fa__UU91d1__UU59d4__UU9879__UU76ee_ : project -> bool

val _UU540c__UU7c7b__UU7533__UU8bf7__UU5e94__UU8ba1__UU6570_ :
  project -> project -> bool

val _UU5e74__UU4efd__UU9608__UU503c_2020 : int

val _UU5e74__UU4efd__UU9608__UU503c_2023 : int

val _UU8d39__UU7528__UU9608__UU503c_200_UU4e07__UU5143_ : int

val _UU6279__UU51c6__UU5e74__UU4efd__UU4e0d__UU65e9__UU4e8e_2020 :
  project -> bool

val _UU6279__UU51c6__UU5e74__UU4efd__UU4e0d__UU65e9__UU4e8e_2023 :
  project -> bool

val _UU8d39__UU7528__UU8d85__UU8fc7_200_UU4e07__UU5143_ : project -> bool

val _UU9879__UU76ee__UU5c5e__UU4e8e__UU603b__UU6570__UU8303__UU56f4_ :
  project -> bool

val _UU72b6__UU6001__UU5c5e__UU4e8e__UU7533__UU8bf7__UU6216__UU5728__UU7814_ :
  project -> bool

val _UU5728__UU7814__UU53c2__UU4e0e__UU9879__UU76ee__UU5e94__UU8ba1__UU6570_ :
  profile -> project -> bool

val _UU5e94__UU8ba1__UU5165__UU8d1f__UU8d23__UU4eba__UU603b__UU6570_ :
  profile -> project -> bool

val _UU5e94__UU8ba1__UU5165__UU53c2__UU4e0e__UU8005__UU603b__UU6570_ :
  profile -> project -> bool

val _UU6309__UU6761__UU4ef6__UU8ba1__UU6570_ :
  (project -> bool) -> project list -> int

val _UU540c__UU7c7b__UU7533__UU8bf7__UU603b__UU6570_ :
  project -> project list -> int

val _UU9879__UU76ee__UU603b__UU6570_ :
  profile -> project -> project list -> int

val _UU8d1f__UU8d23__UU4eba__UU9879__UU76ee__UU603b__UU6570_ :
  profile -> project -> project list -> int

val _UU53c2__UU4e0e__UU8005__UU9879__UU76ee__UU603b__UU6570_ :
  profile -> project -> project list -> int

val _UU79d1__UU6280__UU90e8__UU91cd__UU70b9__UU7814__UU53d1__UU6807__UU8bc6__UU7eb3__UU5165__UU8054__UU5408__UU9650__UU9879_ :
  project -> bool

val _UU79d1__UU6280__UU91cd__UU5927__UU4e13__UU9879__UU6807__UU8bc6__UU7eb3__UU5165__UU8054__UU5408__UU9650__UU9879_ :
  project -> bool

val _UU8054__UU5408__UU9650__UU9879__UU7c7b__UU522b__UU4e0e__UU89d2__UU8272__UU5339__UU914d_ :
  profile -> project -> bool

val _UU9879__UU76ee__UU5e94__UU8ba1__UU5165__UU8054__UU5408__UU9650__UU9879_ :
  profile -> project -> bool

val _UU8054__UU5408__UU9650__UU9879__UU9879__UU76ee__UU603b__UU6570_ :
  profile -> project -> project list -> int

val _UU57fa__UU91d1__UU59d4__UU603b__UU6570__UU8fdd__UU89c4__UU5217__UU8868_ :
  profile -> project -> project list -> Domain_types.violation list

val _UU8054__UU5408__UU9650__UU9879__UU8fdd__UU89c4__UU5217__UU8868_ :
  profile -> project -> project list -> Domain_types.violation list

val _UU8fdd__UU89c4__UU5217__UU8868_ :
  profile -> project -> project list -> Domain_types.violation list

val _UU68c0__UU67e5_ :
  profile -> project -> project list -> Domain_types.decision

val same_type_application_count : project -> project list -> int

val total_count : profile -> project -> project list -> int

val leader_count : profile -> project -> project list -> int

val participant_count : profile -> project -> project list -> int

val joint_count : profile -> project -> project list -> int

val violations :
  profile -> project -> project list -> Domain_types.violation list

val check : profile -> project -> project list -> Domain_types.decision
