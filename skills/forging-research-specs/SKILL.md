---
name: forging-research-specs
description: >-
  Use when turning a rough or half-formed research idea into a rigorous, top-venue-grade problem
  definition and an executable research spec. Triggers: "formalize this idea", "turn this into a
  research problem/project", "is X a good fit for Y", "write a research brief / problem statement",
  or when one artifact must be both human-readable and runnable by an AI agent (auto-experiments,
  dataset search, debug loop). Counters the failure where a capable agent produces a complete-looking
  spec whose numbers, citations, datasets, libraries, thresholds, and novelty claims are inherited
  from memory and stated as fact without verification.
---

# Forging Research Specs

## Overview

A research spec is **not a template to fill in** — a capable agent already produces all the
sections. The hard part, and the only part that matters, is **rigor**: refusing to state any
remembered or inherited fact as established.

**Core principle: Inherited ≠ established. Remembered ≠ verified.** Forging a spec = elevate the
idea → formalize it → ground every load-bearing claim in real, checked evidence → make it
machine-executable. The structure is easy; the discipline is the skill.

## When to Use

- A half-formed idea needs elevating to a complete, defensible research problem
- You need a math/physics/AI problem definition (inputs, outputs, objective, constraints)
- The output must drive an AI agent's experiments, dataset search, and debug loop
- You're writing a problem statement / research brief aimed at a top venue

**Not for:** writing the full paper (use academic-paper), running the experiments (the spec is the
contract a separate execution loop consumes), or a standalone literature review (use deep-research).

## The Iron Rule

Every **load-bearing claim** — a number, citation, dataset, library/API, threshold, or novelty
claim — is exactly one of two things:

1. **VERIFIED** — grounded in a real source you actually checked *this session*, or
2. **UNVERIFIED** — explicitly tagged, with a verification task attached (and kept off the critical path).

There is no third option. **Stating a remembered fact as established is the failure this skill
exists to prevent.** Violating the letter of this rule is violating its spirit.

## Process (6 phases)

1. **Elevate** — find the general problem behind the specific idea; raise it one abstraction level.
2. **Formalize** — input/output spaces (with dims), objective/loss fully specified (no
   named-but-undefined terms), constraints, assumptions as a *closed list*, the formal object.
3. **Ground (MANDATORY)** — actually search. Verify every citation, dataset, and library against a
   real source (WebSearch / arXiv / dataset registry / package index). This phase has teeth — see below.
4. **Position** — per-paper related work (each: verified citation + its *specific* limitation + how
   this differs), including the *closest* prior art. A novelty claim must survive an adjacent-work
   check before it is written as "first".
5. **Operationalize** — fill the machine-actionable blocks: datasets, reuse inventory, experiments,
   gates, two-tier feedback loop, threats. See **spec-template.md**.
6. **Adversarial audit** — *resolve* (don't just name) circularity/leakage; justify every threshold
   and confront contrary on-record evidence; ensure no contribution rests on an unproven assumption.

## Plain Language — in the spec AND when you talk to the human

A correct spec the researcher can't read is a failed spec. Rigor and readability are **both**
required — not a trade-off. This applies in two places.

### 1. Inside the spec artifact — gloss every term at first mention

The FIRST time the artifact uses a term a bright non-specialist wouldn't instantly understand —
jargon, an acronym, a named method, a math symbol, a metric, a domain object — it carries a
one-breath plain-language gloss, **in the reader's language (中文)**, saying what it IS or DOES (not
a formal restatement — the one-line version you'd say out loud):

- **In prose:** parenthetical right after the term —
  `diffeomorphism(形变必须平滑可逆，不能撕裂)`, `posterior spread(模型自己觉得有多不确定)`.
- **In math:** every symbol/object gets a word —
  `Objective L(优化目标，越小越好)`, `phi_1(图像变形到最后一刻的结果)`.
- **In the YAML blocks:** keep keys/values parse-clean; put the gloss in a trailing `# plain: …`
  comment on the line where the term first appears — never inside the value.

Gloss **once**, at first mention. The gloss serves the human; it never replaces the exact term the
executing agent consumes.

### 2. When you SPEAK to the researcher — report in plain words, not labels

This skill's own vocabulary — *gate, locator, provenance, VERIFIED/UNVERIFIED/INHERITED, BLOCKED,
critical-path, citation-audit, reuse_inventory, PROVISIONAL, on_critical_path* — is **internal
bookkeeping for the spec file, not the language you report back in.** Every status update, summary,
finding, or next-step recommendation you give the researcher is in plain 中文 that someone who has
never read this skill would understand.

**Lead with the plain meaning; the technical label, if it appears at all, goes in parentheses after
it — never the reverse.** A report stuffed with the skill's labels IS the failure.

| Don't report like this (label-first, opaque) | Report like this (meaning-first, plain) |
|---|---|
| "gate-0 是命门：ŝ-vs-error AUROC≥0.70 且超基线，contrary_evidence 写了 0.42" | "最关键的一关：模型对‘自己有多没把握’的估计，得真能预示它哪里会出错（相关性要中等以上，技术名 AUROC≥0.70）。可你之前只做到 0.42、比瞎猜还差，所以这关现在是反着的，必须先攻下来。" |
| "整份 PROVISIONAL；4 个 locator 待 citation-audit；gate-3 BLOCKED_until 拿到对比" | "这份还只是草稿：里面引的文献，我得另找一个独立的去逐条核实过才算数；跟某个对手方法的正面对比还没拿到，那部分先空着。" |
| "datasets 医学 on_critical_path: false 后置；reuse_inventory 里 4 个标 UNVERIFIED" | "医学数据先不碰，等主实验通了再说；有 4 个现成工具我还没亲自查过，先记着待查。" |

## The Verification Mandate (the teeth)

The dominant failure mode: an agent writes *"I should ground these load-bearing claims"* — then
writes *"I'll proceed directly, no tool calls needed"* and fills the spec from memory.

**If you flag a claim as load-bearing, or notice you "should verify" something — that is a
verification task, not a disclaimer. STOP and run the search NOW, before you write the claim as
fact.** A spec built on unverified memory is the wrong spec, however complete it looks.

### Rationalizations — STOP and verify

| Rationalization (observed in baseline) | Reality |
|---|---|
| "Proceed directly — the task is to write the doc now, no tool calls needed." | Writing the doc IS the task; an unverified doc is the *wrong* doc. The flag you just wrote is a TODO. |
| "Do not re-litigate — these are measured facts." | Inherited ≠ established. A number you can't point a reader to is UNVERIFIED. Tag it or re-establish it. |
| "The teacher / pseudo-GT gives ground-truth targets." | A model's output is an estimate, not truth. Using it as truth to train/evaluate another model is circularity — resolve or gate it. |
| "Reuse the >0.70 gate from the parent project." | If on-record results failed that bar, it is a fantasy gate. Justify the cutoff and confront the contrary result. |
| "It's structurally impossible for the alternative — we're first." | Novelty from analogy is overclaim. Check + contrast the closest prior art before writing "first". |
| "These propositions will be proved in the paper." | An unproven load-bearing theorem is a risk, not a spine. Mark UNVERIFIED + add a derivation task. |
| "This identity transfers to our setting." | Transfer across a structurally different setting is a claim. Derive it or flag it. |

### Red Flags — STOP

- You wrote "I should verify/ground X" and kept going without doing it
- A number / citation / dataset / library with no source you checked this session
- "measured facts", "well-known", "established" guarding an unverifiable claim
- A "first / impossible for X" novelty claim with no adjacent-work check
- A threshold with no derivation, or one your own cited evidence contradicts
- A model's output used as "ground truth"
- A "machine-readable" section that is really just prose / markdown tables
- Related work grouped instead of per-paper limitation + contrast

**All of these mean: STOP, verify or resolve, then write.**

## Provenance Tagging

In the artifact, every load-bearing fact carries an inline tag — no bare assertions:

- `[VERIFIED: <url/arXiv/DOI> — <exact thing the source states>]` — content checked this session
- `[UNVERIFIED → <verify-task>]` — not yet grounded; on the to-do list, NOT on the critical path
- `[INHERITED: project memory — re-establish]` — from prior work, not yet re-checked

## Tag Discipline (the tag is a contract, not a label)

Running the skill closes the gross failures but exposes a subtler family: the **tag itself gets
gamed**. These rules make a tag falsifiable.

- **A tag demotes; it never promotes.** Tagging an unverified number does not make it usable. An
  INHERITED / UNVERIFIED claim may not sit on the critical path — and a GO/NO-GO threshold *or its
  comparator* IS the critical path. A gate resting on an INHERITED/UNVERIFIED number is
  `status: BLOCKED` (not executable) until re-established. Never present it as the operative bar.
- **VERIFIED needs a retrievable locator + what you read.** `[VERIFIED: <url/arXiv/DOI> — <the
  exact thing the source states>]`. A title or search snippet is NOT content verification; if you
  only saw the title, it is `[UNVERIFIED → read source]`.
- **One tag, one atomic claim.** Never stretch one VERIFIED across a compound fact (several
  numbers), and never let it cover your *characterization* of the fact — "underperforms on UQ"
  (source) ≠ "near-deterministic, crippling its UQ" (your spin). Mechanism descriptors and specific
  numbers each need their own check.
- **Justification ≠ provenance.** A gate's `justification` is a derivation or a cited basis for that
  exact cutoff. "It's pre-registered" / "we used it before" / "it's the user's bar" is provenance,
  not justification. With no basis, write `justification: NONE — needs derivation`; do not launder
  provenance into justification.
- **No self-certified sufficiency.** You do not get to write "I now have all load-bearing facts
  verified, proceeding." Sufficiency is shown by the ledger, not declared in prose. If ANY
  critical-path claim (core novelty, gate threshold, headline dataset/number) is still UNVERIFIED,
  you do NOT have enough grounding — mark the spec `BLOCKED on: <items>` and forge only the
  non-blocked parts.
- **Cheap-check rule.** Before tagging UNVERIFIED, ask: resolvable in 1–2 searches right now? If
  yes, do it. UNVERIFIED is only for the genuinely unresolvable this session (gated data, unproven
  theorems, future measurements) — not for what you didn't bother to look up.
- **Framing inherits the weakest link.** The Thesis and Significance may not assert as settled
  anything the body marks UNVERIFIED. If the core claim is UNVERIFIED, section 0 says "we test
  whether / we conjecture", not "we provide". The hedge travels WITH the claim at first mention,
  never buried later.

### Tag-gaming rationalizations — STOP (found WITH the skill)

| Rationalization | Reality |
|---|---|
| "I now have all load-bearing facts verified — let me compose." | Sufficiency is shown by the ledger, not declared. Any critical-path claim still UNVERIFIED → you don't have enough; mark BLOCKED. |
| "[VERIFIED via search title]" / "VERIFIED: secondary-source synthesis" | A title/snippet is not content. VERIFIED needs a retrievable locator + the exact thing stated. Else `UNVERIFIED → read source`. |
| "near-deterministic, crippling its UQ [VERIFIED]" (source says only "underperforms") | The tag covers the fact, not your spin. One atomic claim per tag. |
| "Threshold is the user's pre-registered bar [INHERITED]" — used as the gate | A tag demotes, never promotes. A gate on an INHERITED number is BLOCKED until re-established; provenance ≠ justification. |
| "TODO — check if authors released code" (when one search finds it) | UNVERIFIED is not a license to skip a cheap check. Resolvable in 1–2 searches → do it now. |

### Tag-gaming red flags — STOP

- "I now have everything I need / enough grounding to proceed" — especially with a core claim still UNVERIFIED
- A VERIFIED tag with no url/arXiv/DOI locator, or one covering only a title-glance
- One VERIFIED tag spanning several numbers, or covering an adjective the source does not state
- A gate firing on an INHERITED/UNVERIFIED number, or a `justification` that is really provenance
- The Thesis states as settled a claim the body marks UNVERIFIED

**All of these mean: STOP, fix the tag (or the gate, or the framing), then continue.**

## The Source/Self Firewall (the deepest rule)

Agents that obey every rule above still game them by satisfying a tag's *form* while violating its
meaning — the master move is **dressing your own reasoning as a source's fact** (a fabricated quote
under a real arXiv id, `[VERIFIED: search synthesis]`, a real DOI on a claim the paper never makes).
One firewall closes the whole class:

- **VERIFIED is only for a claim literally present in a primary source you OPENED this session.** If
  you synthesized it from snippets, inferred it, named it, or proposed it — it is YOURS:
  `[MINE: <your claim>]` or `[UNVERIFIED]`, never VERIFIED. "search snippet", "search synthesis",
  "secondary sources" are NOT verification. A quote is *copied*, not reconstructed; if you cannot
  reproduce the literal string from the source, it is a paraphrase → UNVERIFIED.
- **Three tiers only — no new species, no split status.** VERIFIED / UNVERIFIED / INHERITED, full
  stop. "VERIFIED-as-method", "VERIFIED synthesis", "PARTIAL", or a `verification: VERIFIED` field
  carrying a `# … UNVERIFIED` comment are all forbidden. A claim's status is its **weakest part**:
  one unverified sub-fact makes the whole claim UNVERIFIED. One tag = one atomic fact (a range
  spanning several methods is several facts).
- **Critical-path is about USE, not label.** A number is on the critical path if it feeds a gate
  threshold, a gate comparator, *or* an experiment's success / expected field — no matter how you
  tagged it. You cannot move it off the critical path by stamping it INHERITED. A gate comparator
  must be verified *for this task/dataset*; a value verified in another domain is not valid (→ BLOCKED).
- **BLOCKED means stop.** There is no "BLOCKED but use the estimate meanwhile". If a claim is
  blocked, the things that depend on it are not asserted.
- **A derivation excludes its neighbors.** It must show why THIS cutoff and not a nearby one
  (0.10 vs 0.05 vs 0.30). If the reasoning would equally license a neighbor, it is a gloss →
  `justification: NONE — needs derivation`.

### The skill cannot certify itself

A producer following this skill *reduces* self-report gaming but cannot eliminate it: a fabricated
quote under a real locator still looks compliant. **The spec is not done until an INDEPENDENT agent
(fresh context, ideally a different model) re-fetches every VERIFIED locator and confirms the source
literally states the claim.** Route the finished artifact through citation-audit / paper-claim-audit.
Until then, every VERIFIED tag is provisional.

## The Spec Template

The full Research Spec structure — human-readable sections + the machine-actionable YAML blocks
(datasets, reuse_inventory, experiments, gates, feedback_loop, threats) — is in **spec-template.md**.
Read it when operationalizing (phase 5).

## Common Mistakes

| Mistake | Fix |
|---|---|
| Filling sections from memory because they "look complete" | Sections aren't the deliverable; verified claims are. Run phase 3. |
| Dual-audience in *intent* (prose + tables) but no parseable block | Emit the actual YAML blocks from spec-template.md. |
| Grouping related work | One entry per paper: verified citation + specific limitation + contrast. |
| Naming a circularity/leakage risk then proceeding | Resolve it or put it behind a gate. |
| Reusing a threshold without justification | Each gate states its derivation + any contrary evidence. |
| Reimplementing what a maintained library already does | Reuse-first: list verified tools in `reuse_inventory`; justify every from-scratch component. |
| Jargon / symbols / named methods with no plain-language gloss at first mention | Gloss each at first use — `term(一句话人话)` in prose, `# plain: …` in YAML. Readable ≠ less rigorous. |
| Reporting to the researcher in the skill's own labels (gate / locator / BLOCKED / UNVERIFIED / critical-path…) | Those are internal bookkeeping. Tell the human what they MEAN in plain 中文; the label, if at all, in parens after. |
