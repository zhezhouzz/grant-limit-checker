From Stdlib Require Import List Arith Bool.
From GrantLimit Require Import Model.
Import ListNotations.

(** 来源映射：NSFC-2026-GENERAL-1，《2026 年度申请规定》第 7 页，二（一）1。 *)
Definition 同类申请应计数 (拟申报项目 : 项目) (已有项目 : 项目) : bool :=
  match 项目状态值 已有项目 with
  | 申请中 => andb (是申请人 (项目角色值 已有项目))
                    (项目类别相同 (项目类别值 拟申报项目) (项目类别值 已有项目))
  | _ => false
  end.

(** 规则阈值是具名数值，而不是让用户直接选择的输入类别。 *)
Definition 年份阈值2020 : nat := 2020.
Definition 年份阈值2023 : nat := 2023.
Definition 费用阈值200万元 : nat := 200.

Definition 批准年份不早于2020 (待判断项目 : 项目) : bool :=
  Nat.leb 年份阈值2020 (批准年份 待判断项目).

Definition 批准年份不早于2023 (待判断项目 : 项目) : bool :=
  Nat.leb 年份阈值2023 (批准年份 待判断项目).

Definition 费用超过200万元 (待判断项目 : 项目) : bool :=
  Nat.ltb 费用阈值200万元 (直接费用万元 待判断项目).

(** 来源映射：NSFC-2026-TOTAL-1，《2026 年度申请规定》第 7–8 页，二（二）1。 *)
Definition 项目属于总数范围 (待判断项目 : 项目) : bool :=
  match 项目类别值 待判断项目 with
  | 不计总数项目 => false
  | 组织间国际合作 =>
      andb (费用超过200万元 待判断项目)
           (是负责人 (项目角色值 待判断项目))
  | _ => true
  end.

Definition 状态属于申请或在研 (待判断项目 : 项目) : bool :=
  match 项目状态值 待判断项目 with
  | 申请中 | 正在承担 => true
  | 申请当年期满 | 初审不予受理 | 已经结题 => false
  end.

Definition 在研参与项目应计数 (人员 : 人员情况) (待判断项目 : 项目) : bool :=
  match 当前职称 人员 with
  | 高级职称 =>
      match 批准时职称 待判断项目 with
      | 非高级职称 => false (* 晋升高级职称后，原作为参与者的在研项目不计入。 *)
      | 高级职称 => 批准年份不早于2020 待判断项目
      end
  | 非高级职称 => 批准年份不早于2023 待判断项目
  end.

Definition 项目应计入总数 (人员 : 人员情况) (待判断项目 : 项目) : bool :=
  andb (项目属于总数范围 待判断项目)
    (match 项目状态值 待判断项目 with
     | 申请中 => true
     | 正在承担 =>
         match 项目角色值 待判断项目 with
         | 申请人 | 项目负责人 => true
         | 主要参与者 => 在研参与项目应计数 人员 待判断项目
         end
     | 申请当年期满 | 初审不予受理 | 已经结题 => false
     end).

Definition 应计入负责人总数 (人员 : 人员情况) (待判断项目 : 项目) : bool :=
  andb (项目应计入总数 人员 待判断项目)
       (是负责人 (项目角色值 待判断项目)).

Definition 应计入参与者总数 (人员 : 人员情况) (待判断项目 : 项目) : bool :=
  andb (项目应计入总数 人员 待判断项目)
       (是参与者 (项目角色值 待判断项目)).

Fixpoint 按条件计数 (条件 : 项目 -> bool) (项目列表 : list 项目) : nat :=
  match 项目列表 with
  | [] => 0
  | 当前项目 :: 其余项目 =>
      (if 条件 当前项目 then 1 else 0) + 按条件计数 条件 其余项目
  end.

Definition 同类申请总数 (拟申报项目 : 项目) (已有项目 : list 项目) : nat :=
  按条件计数 (同类申请应计数 拟申报项目) 已有项目 + 1.

Definition 项目总数 (人员 : 人员情况) (拟申报项目 : 项目)
    (已有项目 : list 项目) : nat :=
  按条件计数 (项目应计入总数 人员) 已有项目 +
  (if 项目应计入总数 人员 拟申报项目 then 1 else 0).

Definition 负责人项目总数 (人员 : 人员情况) (拟申报项目 : 项目)
    (已有项目 : list 项目) : nat :=
  按条件计数 (应计入负责人总数 人员) 已有项目 +
  (if 应计入负责人总数 人员 拟申报项目 then 1 else 0).

Definition 参与者项目总数 (人员 : 人员情况) (拟申报项目 : 项目)
    (已有项目 : list 项目) : nat :=
  按条件计数 (应计入参与者总数 人员) 已有项目 +
  (if 应计入参与者总数 人员 拟申报项目 then 1 else 0).
