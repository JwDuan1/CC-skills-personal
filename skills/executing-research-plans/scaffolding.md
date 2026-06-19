# Scaffolding for Executing Research Plans

Load this when running any research task. Goal: every step leaves enough trail that a wrong step can be rolled back and a good result can be independently reviewed. These are positive templates — fill every field.

## Per-task folder

```
research_runs/
  task_037_uncertainty_rejection/
    task_card.md
    note.md
    command.txt
    config.yaml          # exact config used
    metrics.csv
    figures/
    sanity_report.md
    stdout.log / error.log
```

## Task Card — write BEFORE touching anything

If you cannot fill "Success criteria" or "Sanity checks", the task is not defined yet — ask the researcher before starting.

```
Task name:
Research goal:
Why this matters:
Input:
Expected output:
Success criteria:        # concrete, checkable
Sanity checks:           # what you will run to trust the result
Possible failure modes:
Need researcher confirmation before acting? yes / no
```

## Note — write AFTER the step

Not a diary — a record you could roll back from.

```
Task:
What changed:            # files touched
Why:
Evidence:                # numbers / plots / sanity results actually produced
Sanity check:            # ran? passed / failed
Result:                  # pass / fail / partial
Problem found:
Decision:                # continue / pause-and-ask / rollback / rerun / review
Next step:
Rollback point:          # git commit hash / saved checkpoint + config
```

## Control points (git)

Before changing code:
```
git status && git diff          # record current state
# if clean and a risky change is next:
git add -A && git commit -m "control: before <task>"
# if dirty: state what is uncommitted; do NOT overwrite silently
```

After a small step passes its sanity check:
```
git commit -m "<type>: <specific change>"
# feat / fix / exp / audit — never "update" or "fix stuff"
```

A control point is more than a checkpoint file. Capture, as relevant:
- **code:** commit hash, diff, files changed, environment
- **experiment:** config, command, seed, output dir, metrics, key figure, sanity report
- **decision:** current hypothesis, evidence, conclusion, why continue / stop / pivot

## Big files do not go in git

Raw data, checkpoints, large tensors / volumes, big output images: record a pointer, not the file.

```
Artifact:
  path: runs/exp_037/checkpoints/iter_001000.pt
  generated_by: python train.py --config configs/exp_037.yaml
  git_commit: abc1234
  sha256: ...
```

## Decision Log — append to decisions.md on every major decision

A major decision = change the research question / main claim / dataset split / metric / baseline / preprocessing / architecture, or drop an outlier / exclude a case / change the paper story. **Never make one silently.**

```
Date:
Decision:
Reason:
Evidence:
Alternatives considered:
Risk:
Confidence: high / medium / low
Need follow-up? yes / no
Rollback point:
```

## Independent review — for key or contradictory results

Trigger when: a result is strong enough to claim, OR results contradict, OR sanity checks keep failing. Use a fresh reviewer (cross-model is best) and answer:

1. Is the conclusion supported by the evidence?
2. Main concern?
3. Possible artifact?
4. Possible data leakage?
5. Missing sanity check?
6. Is the baseline fair?
7. Is the claim too strong?
8. Recommended next step: continue / rerun / rollback / pause?

## Session summary — end of each working session

```
What was completed:
Evidence generated:
What failed / still uncertain:
Decisions made:
Risks that appeared:
Recommended next step:
Need researcher confirmation? yes / no
Rollback point:
```
