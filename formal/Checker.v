From Stdlib Require Import List Arith Bool.
From GrantLimit Require Import Model Rules2026.
Import ListNotations.

Definition 同类申请违规列表 (拟申报项目 : 项目)
    (已有项目 : list 项目) : list 违规原因 :=
  if 属于基金委项目 拟申报项目 then
    if Nat.leb (同类申请总数 拟申报项目 已有项目) 1
    then [] else [同年同类申请超限]
  else [].

Definition 基金委总数违规列表 (人员 : 人员情况) (申请年度 : nat)
    (拟申报项目 : 项目)
    (已有项目 : list 项目) : list 违规原因 :=
  if 属于基金委项目 拟申报项目 then
    match 当前职称 人员 with
    | 高级职称 =>
        if Nat.leb (项目总数 人员 申请年度 拟申报项目 已有项目) 2
        then [] else [高级职称总数超限]
    | 非高级职称 =>
        (if Nat.leb (负责人项目总数 人员 申请年度 拟申报项目 已有项目) 1
         then [] else [非高级职称负责人超限]) ++
        (if Nat.leb (参与者项目总数 人员 申请年度 拟申报项目 已有项目) 2
         then [] else [非高级职称参与者超限])
    end
  else [].

Definition 联合限项违规列表 (人员 : 人员情况) (申请年度 : nat)
    (拟申报项目 : 项目)
    (已有项目 : list 项目) : list 违规原因 :=
  if 项目应计入联合限项 人员 申请年度 拟申报项目 then
    if Nat.leb (联合限项项目总数 人员 申请年度 拟申报项目 已有项目) 2
    then [] else [国家科技计划联合限项超限]
  else [].

Definition 违规列表 (人员 : 人员情况) (申请年度 : nat) (拟申报项目 : 项目)
    (已有项目 : list 项目) : list 违规原因 :=
  同类申请违规列表 拟申报项目 已有项目 ++
  基金委总数违规列表 人员 申请年度 拟申报项目 已有项目 ++
  联合限项违规列表 人员 申请年度 拟申报项目 已有项目.

Definition 检查 (人员 : 人员情况) (申请年度 : nat) (拟申报项目 : 项目)
    (已有项目 : list 项目) : 判定结果 :=
  match 违规列表 人员 申请年度 拟申报项目 已有项目 with
  | [] => 允许
  | _ => 阻止
  end.
