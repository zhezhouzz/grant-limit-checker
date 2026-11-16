From Stdlib Require Import List Arith Bool.
Import ListNotations.

Inductive 专业技术职称 : Type :=
| 高级职称
| 非高级职称.

(** 规则必须绑定到正式指南版本，不能只绑定到“科技部项目”这一大类。 *)
Inductive 指南版本 : Type :=
| 基金委2026申请规定
| 科技部2026发育编程与合成生物学
| 科技部2026数学物理人工智能五专项
| 未指定科技部指南.

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
| 不计总数项目
| 国家重点研发计划
| 国家科技重大专项
| 中科院抢占科技制高点专项
| 国家实验室专项.

Inductive 项目角色 : Type :=
| 申请人
| 项目负责人
| 主要参与者
| 课题负责人
| 学术带头人
| 骨干成员
| 其他研究人员.

(** “申请中”表示尚未正式受理的拟申报或同时申报项目；正式受理和评审中
    单独建模，因为青年、群体、仪器等项目在不同阶段的计数方式不同。 *)
Inductive 项目状态 : Type :=
| 申请中
| 已正式受理
| 评审中
| 正在承担
| 已退出
| 初审不予受理
| 未获资助
| 已经结题.

Inductive 项目标识 : Type :=
| 无特殊标识
| 青年科学家标识
| 科技型中小企业标识
| 国际合作类标识
| 政府间国际合作标识
| 战略性港澳台合作标识
| 部门推荐标识
| 科学仪器方向标识.

(** 项目的原始事实。基金委通用规则多按年度判断，而部分科技部指南使用
    “早于 2026-12-31”这样的精确日期边界，因此结束月、日不能省略。
    直接费用与中央财政专项资金预算也是两个不同的金额概念。 *)
Record project : Type := mkProject {
  guide : 指南版本;
  kind : 项目类别;
  tag : 项目标识;
  role : 项目角色;
  status : 项目状态;
  approval_year : nat;
  end_year : nat;
  end_month : nat;
  end_day : nat;
  direct_cost_wan : nat;
  central_budget_wan : nat;
  title_at_approval : 专业技术职称
}.

Record profile : Type := mkProfile {
  current_title : 专业技术职称
}.

(** 规则层使用的中文领域接口；英文记录名仅作为 OCaml 抽取边界。 *)
Notation 项目 := project.
Notation 人员情况 := profile.
Definition 指南版本值 := guide.
Definition 项目类别值 := kind.
Definition 项目标识值 := tag.
Definition 项目角色值 := role.
Definition 项目状态值 := status.
Definition 批准年份 := approval_year.
Definition 执行期结束年份 := end_year.
Definition 执行期结束月份 := end_month.
Definition 执行期结束日 := end_day.
Definition 直接费用万元 := direct_cost_wan.
Definition 中央财政专项资金预算万元 := central_budget_wan.
Definition 批准时职称 := title_at_approval.
Definition 当前职称 := current_title.
Definition 建立项目 := mkProject.
Definition 建立人员情况 := mkProfile.

Inductive 违规原因 : Type :=
| 同年同类申请超限
| 上年度获资助同类项目受限
| 高级职称总数超限
| 非高级职称负责人超限
| 非高级职称参与者超限
| 国家科技计划联合限项超限
| 科学仪器项目联合限项超限
| 国家科技计划同期负责人申报超限
| 国家科技计划在研项目负责人申报受限
| 国家科技计划在研课题负责人牵头受限
| 国家科技计划人员总数超限
| 退出国家科技计划执行期内申报受限.

Inductive 复核原因 : Type :=
| 科技部指南版本未指定
| 基金委特殊规则尚未完整覆盖.

Inductive 判定结果 : Type :=
| 允许
| 阻止
| 需要人工复核.

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
  | 专项长期, 专项长期 | 不计总数项目, 不计总数项目
  | 国家重点研发计划, 国家重点研发计划
  | 国家科技重大专项, 国家科技重大专项
  | 中科院抢占科技制高点专项, 中科院抢占科技制高点专项
  | 国家实验室专项, 国家实验室专项 => true
  | _, _ => false
  end.

Definition 是申请人 (r : 项目角色) : bool :=
  match r with 申请人 => true | _ => false end.

Definition 是负责人 (r : 项目角色) : bool :=
  match r with 申请人 | 项目负责人 => true | _ => false end.

Definition 是项目负责人角色 (r : 项目角色) : bool :=
  match r with 项目负责人 => true | _ => false end.

Definition 是项目或课题负责人 (r : 项目角色) : bool :=
  match r with 申请人 | 项目负责人 | 课题负责人 => true | _ => false end.

Definition 是主要参与者 (r : 项目角色) : bool :=
  match r with 主要参与者 => true | _ => false end.

Definition 是科技计划参与角色 (r : 项目角色) : bool :=
  match r with 骨干成员 | 其他研究人员 => true | _ => false end.

Definition 是学术带头人或骨干成员 (r : 项目角色) : bool :=
  match r with 申请人 | 学术带头人 | 骨干成员 => true | _ => false end.
