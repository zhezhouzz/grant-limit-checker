From Stdlib Require Import List Arith Bool.
Import ListNotations.

Inductive 专业技术职称 : Type :=
| 高级职称
| 非高级职称.

Inductive 项目类别 : Type :=
| 面上项目
| 重点项目
| 重大项目
| 重大研究计划
| 联合基金
| 青年C类
| 青年B类
| 青年A类
| 地区科学基金
| 重点国际合作
| 组织间国际合作
| 重大科研仪器
| 创新研究群体
| 卓越研究群体
| 原创探索长期
| 专项长期
| 不计总数项目.

Inductive 项目角色 : Type :=
| 申请人
| 项目负责人
| 主要参与者.

Inductive 项目状态 : Type :=
| 申请中
| 正在承担
| 申请当年期满
| 初审不予受理
| 已经结题.

(** 项目的原始事实。年份和金额保留为数值，由具体年度规则定义阈值谓词。 *)
Record project : Type := mkProject {
  kind : 项目类别;
  role : 项目角色;
  status : 项目状态;
  approval_year : nat;
  direct_cost_wan : nat;
  title_at_approval : 专业技术职称
}.

Record profile : Type := mkProfile {
  current_title : 专业技术职称
}.

(** 规则层使用的中文领域接口；英文记录名仅作为 OCaml 抽取边界。 *)
Notation 项目 := project.
Notation 人员情况 := profile.
Definition 项目类别值 := kind.
Definition 项目角色值 := role.
Definition 项目状态值 := status.
Definition 批准年份 := approval_year.
Definition 直接费用万元 := direct_cost_wan.
Definition 批准时职称 := title_at_approval.
Definition 当前职称 := current_title.
Definition 建立项目 := mkProject.
Definition 建立人员情况 := mkProfile.

Inductive 违规原因 : Type :=
| 同年同类申请超限
| 高级职称总数超限
| 非高级职称负责人超限
| 非高级职称参与者超限.

Inductive 判定结果 : Type :=
| 允许
| 阻止.

Definition 项目类别相同 (x y : 项目类别) : bool :=
  match x, y with
  | 面上项目, 面上项目 | 重点项目, 重点项目 | 重大项目, 重大项目
  | 重大研究计划, 重大研究计划 | 联合基金, 联合基金
  | 青年C类, 青年C类 | 青年B类, 青年B类 | 青年A类, 青年A类
  | 地区科学基金, 地区科学基金 | 重点国际合作, 重点国际合作
  | 组织间国际合作, 组织间国际合作
  | 重大科研仪器, 重大科研仪器
  | 创新研究群体, 创新研究群体
  | 卓越研究群体, 卓越研究群体
  | 原创探索长期, 原创探索长期
  | 专项长期, 专项长期 | 不计总数项目, 不计总数项目 => true
  | _, _ => false
  end.

Definition 是申请人 (r : 项目角色) : bool :=
  match r with 申请人 => true | _ => false end.

Definition 是负责人 (r : 项目角色) : bool :=
  match r with 申请人 | 项目负责人 => true | 主要参与者 => false end.

Definition 是参与者 (r : 项目角色) : bool :=
  match r with 主要参与者 => true | _ => false end.
