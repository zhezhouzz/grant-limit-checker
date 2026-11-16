From Stdlib Require Import List Arith Bool Lia.
From GrantLimit Require Import Model Rules2026 Checker.
Import ListNotations.

Theorem 高级职称总数超限诊断可靠 :
  forall 人员 拟申报项目 已有项目,
    当前职称 人员 = 高级职称 ->
    In 高级职称总数超限 (违规列表 人员 拟申报项目 已有项目) ->
    2 < 项目总数 人员 拟申报项目 已有项目.
Proof.
  intros 人员 拟申报项目 已有项目 当前为高级职称 出现超限诊断.
  unfold 违规列表 in 出现超限诊断.
  repeat rewrite in_app_iff in 出现超限诊断.
  destruct 出现超限诊断 as [同类诊断 | [总数诊断 | 联合诊断]].
  - unfold 同类申请违规列表 in 同类诊断.
    destruct (属于基金委项目 拟申报项目);
      destruct (Nat.leb (同类申请总数 拟申报项目 已有项目) 1);
      simpl in 同类诊断; intuition discriminate.
  - unfold 基金委总数违规列表 in 总数诊断.
    destruct (属于基金委项目 拟申报项目); [| contradiction].
    rewrite 当前为高级职称 in 总数诊断.
    destruct (Nat.leb (项目总数 人员 拟申报项目 已有项目) 2) eqn:总数未超限.
    + contradiction.
    + apply Nat.leb_gt in 总数未超限. exact 总数未超限.
  - unfold 联合限项违规列表 in 联合诊断.
    destruct (项目应计入联合限项 人员 拟申报项目);
      destruct (Nat.leb (联合限项项目总数 人员 拟申报项目 已有项目) 2);
      simpl in 联合诊断; intuition discriminate.
Qed.

Theorem 允许判定不含违规 :
  forall 人员 拟申报项目 已有项目,
    检查 人员 拟申报项目 已有项目 = 允许 ->
    违规列表 人员 拟申报项目 已有项目 = [].
Proof.
  intros 人员 拟申报项目 已有项目 判定为允许.
  unfold 检查 in 判定为允许.
  destruct (违规列表 人员 拟申报项目 已有项目); congruence.
Qed.

Example 高级职称第三个项目被阻止 :
  let 人员 := 建立人员情况 高级职称 in
  let 已有面上 := 建立项目 面上项目 无特殊标识 项目负责人 正在承担 2025 0 高级职称 in
  let 已有重点 := 建立项目 重点项目 无特殊标识 项目负责人 正在承担 2024 0 高级职称 in
  let 拟申报项目 := 建立项目 青年C类 无特殊标识 申请人 申请中 2026 0 高级职称 in
  检查 人员 拟申报项目 [已有面上; 已有重点] = 阻止.
Proof. reflexivity. Qed.

Example 申请当年期满项目不计入 :
  let 人员 := 建立人员情况 高级职称 in
  let 当年期满项目 := 建立项目 面上项目 无特殊标识 项目负责人 申请当年期满 2024 0 高级职称 in
  let 拟申报项目 := 建立项目 青年C类 无特殊标识 申请人 申请中 2026 0 高级职称 in
  检查 人员 拟申报项目 [当年期满项目] = 允许.
Proof. reflexivity. Qed.

Example 组织间国际合作金额边界 :
  let 人员 := 建立人员情况 高级职称 in
  let 恰好200万元 := 建立项目 组织间国际合作 无特殊标识 项目负责人 正在承担 2025 200 高级职称 in
  let 超过200万元 := 建立项目 组织间国际合作 无特殊标识 项目负责人 正在承担 2025 201 高级职称 in
  项目应计入总数 人员 恰好200万元 = false /\
  项目应计入总数 人员 超过200万元 = true.
Proof. split; reflexivity. Qed.

Example 基金委与科技部第三个联合限项项目被阻止 :
  let 人员 := 建立人员情况 高级职称 in
  let 基金委重大 := 建立项目 重大项目 无特殊标识 项目负责人 正在承担 2025 0 高级职称 in
  let 科技部重点研发 := 建立项目 国家重点研发计划 无特殊标识 课题负责人 正在承担 2025 0 高级职称 in
  let 拟申报重大专项 := 建立项目 国家科技重大专项 无特殊标识 项目负责人 申请中 2026 0 高级职称 in
  检查 人员 拟申报重大专项 [基金委重大; 科技部重点研发] = 阻止.
Proof. reflexivity. Qed.

Example 青年科学家项目不计入联合限项 :
  let 人员 := 建立人员情况 高级职称 in
  let 基金委重大 := 建立项目 重大项目 无特殊标识 项目负责人 正在承担 2025 0 高级职称 in
  let 科技部重点研发 := 建立项目 国家重点研发计划 无特殊标识 课题负责人 正在承担 2025 0 高级职称 in
  let 拟申报青年科学家 := 建立项目 国家重点研发计划 青年科学家标识 项目负责人 申请中 2026 0 高级职称 in
  检查 人员 拟申报青年科学家 [基金委重大; 科技部重点研发] = 允许.
Proof. reflexivity. Qed.
