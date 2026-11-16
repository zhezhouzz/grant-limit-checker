# 纵向项目限项检查器

[![Rocq](https://img.shields.io/badge/formalized%20in-Rocq-6b4fbb)](https://rocq-prover.org/)
[![Deploy GitHub Pages](https://github.com/zhezhouzz/grant-limit-checker/actions/workflows/pages.yml/badge.svg)](https://github.com/zhezhouzz/grant-limit-checker/actions/workflows/pages.yml)

一个面向国家自然科学基金委、科技部等纵向科研项目限项规则的开源、可追溯、可执行检查器。

项目把限项规定写成 Rocq 中的形式化定义和可证明判定函数，再抽取为 OCaml，由网页计算器直接调用。网页端对类别使用受控选项，对年份和金额执行数值范围校验；每一条诊断都应能追溯到正式文件、适用年度和具体条款。

> **免责声明：** 本项目是非官方的社区项目，与国家自然科学基金委员会、科学技术部或任何项目主管部门无隶属、授权或背书关系。计算结果仅供申报准备参考，不构成官方认定、法律意见或申报保证。规则可能不完整、过时或存在解释偏差；请始终以申报当年的正式指南、主管部门和依托单位解释为准。使用者应自行核实并承担据此采取行动的风险。

## 当前状态

这是一个可执行的早期 MVP。目前覆盖 2026 年国家自然科学基金的一小部分通用规则，以及基金委项目与国家科技计划之间的联合限项：

- 同一申请人同年只能申请 1 项同类型项目（仅实现一般情形）；
- 高级职称人员，纳入总数范围的申请和在研项目合计限 2 项；
- 非高级职称人员，作为申请人申请与负责人在研合计限 1 项；
- 非高级职称人员，作为主要参与者申请与在研合计限 2 项；
- 申请当年到期和初审不予受理的项目不计入总数；
- 高级/非高级职称主要参与者的 2020/2023 年计数起点，以及晋升高级职称后的参与项目例外；
- 批准年份和直接费用作为具体数值进入内核，再由 `批准年份不早于2020`、`批准年份不早于2023`、`费用超过200万元` 等谓词判断；项目类别不携带隐含金额档位。
- 国科办资〔2022〕107 号规定的跨部门联合限项：符合实施范围的申请和在研项目合计限 2 项；
- 国家重点研发计划、国家科技重大专项，以及青年科学家、科技型中小企业、国际合作类和部门推荐等项目标识；
- 青年科学家项目等文件明确列出的项目不进入相应联合限项计数。

科技部项目目前只实现上述联合限项，不代表已经覆盖国家重点研发计划或国家科技重大专项各自指南中的全部限制。尚未覆盖的项目特殊规定会明确显示为“尚未形式化”，不会被静默推断。

## 架构

```text
formal/              Rocq 模型、2026 规则、检查器和证明
      │ extraction
      ▼
kernel/generated/    Rocq 抽取的 OCaml
kernel/               OCaml → JavaScript 边界（js_of_ocaml）
      │ kernel.js
      ▼
web/                  Vite + TypeScript 静态网页
docs/sources/         来源目录与规则—条款映射
```

形式化内核是判定的唯一可信来源。TypeScript 不重复实现限项规则，只负责规范化输入、调用内核，以及把内核返回的规则编号渲染为可读诊断。Rocq 的领域定义和注释使用中文；`Extraction.v` 中只有一层 ASCII 包装器用于稳定的 OCaml ABI。

网页的“形式化模型”视图在构建时直接导入 `formal/Model.v`、`Rules2026.v`、`Checker.v` 和 `Soundness.v`，因此展示内容与当前部署版本保持同步。

## 本地运行

依赖：Rocq、OCaml、Dune、js_of_ocaml、Node.js 20+。

```sh
opam install . --deps-only
npm --prefix web install
make verify
make dev
```

然后打开 Vite 输出的本地地址。生产构建：

```sh
make build
```

静态文件位于 `web/dist/`，可直接部署到 GitHub Pages。
OCaml 网页内核固定使用 Dune `release` profile 构建；验证流程会拒绝超过 200 KB 的内核，避免误部署带内联 source map 的开发产物。

## 添加规则

1. 先在 `docs/sources/` 登记官方来源、归档链接、页码/条款及原文摘要。
2. 在 Rocq 中添加带稳定 ID 的规则，并把复杂条件拆成可审查的定义。
3. 为允许、拒绝、边界年份和例外情形添加证明或测试。
4. 抽取 OCaml 内核，更新网页诊断文案。
5. 在 Issue 或 Pull Request 中说明规则解释；存在歧义时应返回“需要人工复核”。

贡献前请阅读 [CONTRIBUTING.md](CONTRIBUTING.md)。

## 许可证

[MIT](LICENSE)
