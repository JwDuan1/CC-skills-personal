---
name: executing-research-plans
description: Use when executing an agreed research plan step by step — running experiments, debugging surprising or contradictory results, about to change a model / metric / preprocessing / hyperparameter, or writing a number or claim into a paper — and every step must stay evidence-backed, reversible, and reviewable with the researcher in the loop. Symptoms: tempted to patch on a hunch, a result looks too good, results contradict each other, unsure whether to change the science.
---

# Executing Research Plans

## Overview

This is the EXECUTION counterpart to forging-research-specs (which turns an idea into a spec). It does NOT invent the research and does NOT run the whole project end-to-end. It takes an agreed plan and executes it one small, controlled step at a time, so the work stays **evidence-backed, reversible, and reviewable**.

**Core principle:** In research, a confident guess is the failure mode — not a slow start. Every change is gated on evidence you actually produced; every step leaves a control point you can roll back to; every decision that moves the science waits for the researcher.

**Violating the letter of these rules is violating the spirit of them.**

## The execution loop

For each task: **Observe → Diagnose → Decide → Act → Recheck.**

1. Write a **Task Card** before touching anything (see scaffolding.md).
2. Make ONE minimal change.
3. Produce **evidence** — numbers, a plot, a log, a sanity check — not a claim.
4. Write a **Note** and create a **control point** (git commit / saved config + seed + output dir).
5. Pick the next action from: continue / warn / pause-and-ask / rerun / rollback / independent-review. Don't just keep going.

## The one rule that actually breaks under pressure: no change without an executed check

> Before you change ANY design, code, hyperparameter, metric, or preprocessing to "fix" something, you must FIRST run a concrete check that tests your hypothesis about the cause.

Baseline test (2026-06): given contradictory training results, agents reliably reject a *wrong* suggested cause — and then substitute their OWN unverified cause and prescribe fixes for it. **Rejecting someone's guess is not investigation. Your replacement guess is still a guess.**

**What counts as a check:** an executed test whose outcome differs depending on the cause — an identity-transform / synthetic-input test, a units / direction / coordinate check, a minimal reproduction, a case-level look, reading the actual code path, a literature check. Reading the config and naming a "textbook" pattern is NOT a check.

| Rationalization (verbatim from baseline) | Reality |
|---|---|
| "This is textbook overfitting to the surrogate." | A familiar signature is a hypothesis, not a diagnosis. Rule out the cheaper, more common cause (an eval / setup bug) with an executed check first. |
| "I don't need diagnostic instrumentation — the signature already isolates it." | If you haven't run the check, you pattern-matched; you didn't localize. "I don't need to look" is exactly the forbidden move. |
| "The evidence is internally consistent and over-determined." | One upstream eval bug produces a consistent symptom set too. Consistency is a reason to test the shared root cause, not to skip testing. |
| "Three independent causes, all visible in the config." | Reading three plausible causes is still reading, not testing. Rank them, verify the top one, change one thing. |
| "lr and Adam are fine, not implicated." | Declaring a component innocent without a check is the same unverified-guess error in the other direction. Mark unchecked things "unverified," not "fine." |

**Red flags — STOP, you are about to guess-and-patch:**
- You are editing code / config to fix something you have not reproduced or instrumented.
- You just rejected a proposed cause and immediately proposed your own.
- The words "clearly", "obviously", "textbook", "already isolates", "over-determined", "must be" appear in your diagnosis.
- You are changing more than one thing at once.

**All of these mean: run one concrete check first. One change at a time.**

## Stop and ask the researcher

Pause and ask — do not decide silently — whenever the decision moves the science:
- Data definitions are unclear (moving/fixed direction, landmark units voxel-vs-mm, train/val/test split, spacing/origin, preprocessing).
- You would change loss, architecture, metric, baseline, threshold, preprocessing, or the research question / main claim.
- You would drop a case, exclude a failure, or remove an "outlier".
- Results contradict each other (loss down but val worse; metric up but visualization worse; uncertainty no better than random rejection; great TRE but high folding).

## Surprising or protocol-breaking numbers are suspected bugs

A too-good result, or a number that only looks good after a protocol change, is a suspected leak / bug until proven otherwise:
- Report the **protocol-faithful** number (e.g. mean over all cases), even when it is worse.
- Surface the anomaly (the outlier, the suspicious gain) for the researcher to decide — never quietly improve it (drop outlier, switch mean→median, tune a threshold on the test set).
- Before a strong result enters a paper / slide / message: audit the split for leakage, look at case-level evidence, get an independent review.

(Agents already do this reliably in testing — so here the skill is a checklist reminder, not a fight.)

## Exploratory vs confirmed

When unsure, a small exploration is fine — but **label it**. Keep these distinct: **confirmed result / exploratory attempt / plausible hypothesis / unverified assumption / failed attempt / reusable finding.** Exploration must be small, isolated, and rollback-able; never let it pollute the main pipeline or get reported as a result.

## Reuse before you build

Before writing new code, time-box a search (~20 min) for an existing repo / package / dataset loader / metric / eval script, and reuse it if license and format fit. Write custom only as a documented fallback.

## Delegate, don't duplicate

- Coding discipline → **REQUIRED SUB-SKILL: karpathy-guidelines**
- Debugging a confirmed bug → **superpowers:systematic-debugging**
- File-based planning / progress tracking → **planning-with-files**
- Turning an idea into a verified spec → **forging-research-specs**
- Independent review of a key result → **superpowers:requesting-code-review**, or a fresh cross-model reviewer

## Scaffolding (do not skip)

Every task leaves a paper trail so a wrong step can be rolled back and a good result can be independently reviewed. Templates, folder layout, git / control-point conventions, and the Decision Log format are in **scaffolding.md**. If the task trains a model, also load **training-monitor.md**.

## When NOT to use

- A one-off question or a trivial mechanical edit.
- The research idea / spec isn't defined yet → use forging-research-specs or brainstorming first.
- You are not executing a research plan (general coding, writing, ops).
