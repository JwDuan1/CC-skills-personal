# Training Monitor

Load this when a task trains a model. Training is one sub-module of executing-research-plans — when a step trains, add these so you are never flying blind on a long run.

## Always produce

- **Structured print every ~20 iterations:** iter, loss (broken down by term), lr, key metric, wall-time.
- **A live loss curve**, continuously overwritten so the researcher can open it anytime:
  ```
  loss_curve_live.png      # x = iteration, y = loss
  ```
- **metrics.csv:** one row per logged step (iter, losses, val metric, folding %, ...).
- **A fixed-case visualization** refreshed each validation — the SAME case every time, so changes are comparable.
- **Checkpoints + resume-from-checkpoint.**

## Do not watch loss alone

Loss going down is not success. Each validation, also check:
- warped image looks anatomically sensible
- DVF / displacement field is plausible (magnitude, smoothness)
- Jacobian / folding (negative-Jacobian fraction) is acceptable
- the real validation metric (e.g. landmark TRE) actually improves
- for uncertainty work: rejection beats **random** rejection (the right baseline)

## Sanity warnings — surface immediately, do NOT silently continue

| Symptom | Likely meaning |
|---|---|
| val metric worsens while loss improves | eval / setup bug → run the identity-transform / units / direction checks from SKILL.md ("no change without an executed check") BEFORE tuning anything |
| folding rises | regularizer kind / strength, or a transform bug |
| metric improves but visualization worsens | metric artifact |
| result suddenly far better than expected | suspected leak → SKILL.md "surprising numbers" |

## Select checkpoints by the validation metric, not by training loss.
