# Research Spec Template

One file. Prose for humans; fenced YAML blocks for the executing agent. Every load-bearing fact
carries a provenance tag (see SKILL.md → "Provenance Tagging" and "Tag Discipline"). A VERIFIED tag
carries a retrievable locator (url/arXiv/DOI) + the exact thing the source states — never a
title-glance, never one tag across several numbers. Delete the guidance comments before use.

**Plain-language gloss (required):** the first time any term a non-specialist wouldn't instantly
get appears — jargon, acronym, named method, math symbol, metric — it carries a one-breath Chinese
gloss saying what it IS/DOES. In prose: `term(一句话人话)`. In YAML: a trailing `# plain: …` comment
on that line. Gloss once at first mention; keep YAML values parse-clean. (See SKILL.md → "Plain-
Language Gloss".)

---

## 0. Thesis
One sentence: the single claim the whole project defends.

## 1. Background & Motivation
The gap. Why now. What stays broken if it is not solved. Each load-bearing fact tagged.

## 2. Problem Definition (formal)
Every term/symbol glossed at first mention (中文一句话人话). Example:
- **Input space** X(输入：例如 CT 图像对) (with dimensions / units), **output space** Y(输出：形变场).
- **Objective / loss** L(优化目标，越小越好) — fully specified; no named-but-undefined terms (if you
  write a Sobolev norm(衡量函数“光滑程度”的范数) or a weight `w`(权重系数), define it).
- **Constraints** (e.g. diffeomorphism(形变必须平滑可逆，不能撕裂), invertibility(可反向变回去)) and
  **assumptions** as a *closed list*.
- The formal object, e.g. `phi_1 = ODESolve(dphi/dt = v_theta(x,t)); warped = M ∘ phi_1`
  (用一个随时间变化的速度场 v 把图像一步步变形，phi_1 是变到最后的位移，warped 是变形后的图像).

## 3. Significance
Who cares, what it unlocks, why this clears the target venue's bar. No hype without a mechanism.

## 4. Related Work (per-paper — never grouped)
For EACH relevant work, *including the closest prior art*:
- Citation `[VERIFIED: author, title, venue, year]`
- What it does (1 line)
- Its **specific** limitation (not a generic "doesn't scale")
- How THIS work differs

## 5. Method Sketch
The approach + the **one** core technical novelty. Any load-bearing theorem/identity is tagged
`[UNVERIFIED → derive]` unless proved or cited.

## 6. Novelty Positioning
One defensible sentence. A "first to / impossible for X" claim requires a passed adjacent-work check
(phase 4) — otherwise downgrade the wording.

## 7. Common Pitfalls / Failure Modes
Domain-specific. For each: the symptom, and how the spec guards against it.

---

# Machine-actionable blocks (an agent parses these verbatim)

```yaml
datasets:
  - name:
    access: { url: , license: , gated: true|false }
    suitability:                 # why this dataset tests the hypothesis
    verification: VERIFIED | UNVERIFIED | INHERITED   # weakest-part wins — one unverified sub-fact = UNVERIFIED;
                                                       # no split-status, no new tiers (see SKILL.md → Source/Self Firewall)

reuse_inventory:                 # "有轮子就要用轮子" — prefer real, checked libraries over reimplementation
  use:
    - tool:                      # real package / repo name
      provides:
      version_checked:
      verification: VERIFIED
  must_reimplement:
    - what:
      why_no_wheel:              # justify every from-scratch component

experiments:
  - id: H1
    hypothesis:
    independent_var:
    dependent_var:
    baselines: [ ]
    metrics: [ ]
    ablations: [ ]
    expected:

gates:                           # GO / NO-GO — quantitative AND justified
                                 # plain: 通关/不通关的硬指标——必须是数字、且说得出为什么是这个数
  - id: gate-1
    metric:                      # plain: 拿什么指标来卡
    threshold:                   # if this OR its comparator is INHERITED/UNVERIFIED, status = BLOCKED
                                 # plain: 卡在多少；首次出现的术语在注释里给一句人话
    justification:               # REQUIRED — a derivation or cited basis for THIS cutoff. Provenance
                                 # ("pre-registered" / "we used it before") is NOT justification;
                                 # with no basis write: NONE — needs derivation
    contrary_evidence:           # REQUIRED if any on-record result argues against this bar
    status: READY | BLOCKED_until:   # BLOCKED until any INHERITED/UNVERIFIED threshold/comparator is re-established
    decision: { pass: GO, fail: }

feedback_loop:
  inner_self_correction:         # autonomous tier — the AI fixes its own mistakes
    error_signals: [ NaN_or_Inf, shape_mismatch, loss_not_decreasing, failing_test, crash ]
    on_error: diagnose_root_cause -> prefer_existing_library_fix -> rerun -> verify
    retry_budget: 3              # tune per project
    escalate_when: [ budget_exhausted, error_implies_design_or_science_issue ]
  outer_human_in_loop:           # collaborative tier — bring it to the researcher
    discussion_triggers: [ design_fork, assumption_to_confirm, problem_redefinition_signal ]
    anomaly_hunter:
      bug: [ NaN, degenerate_output, identity_transform ]
      too_good_to_be_true: [ metric_leakage, train_test_contamination, eval_on_train ]
      domain_red_flags: [ ]      # e.g. negative_jacobian, non_diffeomorphic, posterior_spread_neq_error
    report_format: { evidence: required, hypothesis: bug_or_finding, ask: explicit_question }

threats_to_validity:
  - threat:
    mitigation:
```

## How the two tiers connect
Inner loop is fast and autonomous (mechanical / code errors → self-correct, reusing libraries).
Outer loop is slow and collaborative (scientific judgment). The **escalation boundary** is the seam:
when self-correction hits its retry budget, or the error implies the *design* or *science* is wrong
(not the code), stop fixing and bring it — with evidence — to the human.
