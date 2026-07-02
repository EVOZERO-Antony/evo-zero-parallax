# Validation report — v0.1.0 Public Preview

Date: 2026-07-03

## Structural validation

- `quick_validate.py skills/parallax`: PASS.
- Clean temporary install at `skills/parallax/SKILL.md`: PASS.
- `SKILL.md`: 120 lines, below the 500-line design limit.
- `agents/openai.yaml` and `CITATION.cff`: valid YAML.
- Runtime dependencies: none.

## Synthetic forward tests

Two separate agent runs used the packaged skill. These runs test instruction behavior, not model-independent validity.

### 1. Strong positive signal / bundled irreversible action

Prompt: decide whether one influencer-driven waitlist spike justifies eight hires and scaled paid acquisition.

Observed behavior:

- separated reversible acquisition tests from irreversible headcount;
- kept bull cases genuinely favorable;
- found the shared unsupported assumption that more demand implies an eight-person bottleneck;
- returned `HOLD` plus precommitted reality-test thresholds.

Result: PASS.

### 2. No agreed values or comparative evidence

Prompt: choose Project A over B because A feels more aligned, without agreed values, metrics, or evidence.

Observed behavior:

- rejected felt alignment as a fixed anchor;
- avoided treating lack of evidence for A as evidence for B;
- classified the result as unresolved;
- returned `HOLD` and a reversible comparison experiment.

Result: PASS.

## Remaining release gate

Keep the `Public Preview` label until at least three independent real-world cases cover:

- overwhelming evidence where honest bull and bear converge;
- conflicting or stale evidence;
- a case with no valid anchor;
- a strongly negative initial framing;
- model or operator correlation across cells.

Record failures as well as successes. v1.0 requires a stable output contract and evidence that the method does not
manufacture false balance.
