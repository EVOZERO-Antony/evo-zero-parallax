# Parallax

**A multi-angle decision check for humans working with AI.**

Parallax pressure-tests a claim or consequential decision from multiple levels of abstraction and from two opposing
adversarial directions at every level. A validated fixpoint keeps the instrument from quietly moving its own reference
while it reasons.

It is built for the moment when a conclusion feels *obvious* — especially when that conclusion is expensive,
irreversible, emotionally loaded, or being pushed by one dominant voice.

> Anchor on what does not move. Get angle from height, not from panning. Attack from both sides. Keep the human above
> the verdict.

## Why Parallax is different

Ordinary red-teaming attacks a proposal from one direction. Parallax runs a mirrored pair at every altitude:

| Control | Question |
|---|---|
| Fixpoint | What must remain true while the angles change? |
| Altitude | What changes when we move above the problem's current plane? |
| Bull | What is the strongest honest case for this? |
| Bear | What is the strongest honest case against this? |
| Critic | Did the instrument itself drift? |

If every cell agrees in one direction, Parallax does not celebrate. It first suspects a false anchor, fake altitude, or
one-sided attack.

## Use it for

- high-stakes or hard-to-reverse decisions;
- conclusions that feel obviously positive or obviously negative;
- founder, product, hiring, investment, strategy, and architecture verdicts;
- decisions where one person, model, or disciplinary lens may dominate.

Do not use it for cheap reversible choices or pure fact-checking. Verify facts first; use Parallax on the verdict.

## Install

The distributable skill lives in [`skills/parallax`](skills/parallax/).

### Codex

Copy that directory into your personal skills folder:

```bash
mkdir -p ~/.codex/skills
cp -R skills/parallax ~/.codex/skills/parallax
```

Then invoke it explicitly:

```text
Use $parallax to pressure-test whether we should launch this product now.
```

You can also ask naturally: `run parallax`, `parallax this`, `check my verdict`, or `am I drifting?`

### Other AI agents

Provide [`skills/parallax/SKILL.md`](skills/parallax/SKILL.md) as an instruction file or project rule. The method has no
tool dependency, but the host must preserve the bull/bear separation and human decision boundary.

## What the output contains

1. A precise target and decision scale.
2. An atom-level fixpoint self-test.
3. A grid of at least three altitudes × bull/bear.
4. A convergence reading and uncertainty band.
5. An adversarial audit of the instrument itself.
6. The deciding axis, next reality test, and explicit human decision boundary.

## Lineage: EVO ZERO

Parallax is a standalone reasoning instrument descended from **EVO ZERO**, the parent operating protocol for governed
human–AI cognition created by Antony Sovetcenkovs.

Its inheritance is concrete:

```text
EVO ZERO principle                 Parallax implementation
-------------------------------    -------------------------------------
Fixpoints govern generation        Validate an anchor before the grid
Challenge belongs inside SWARM     Run bull and bear at every altitude
AUDIT is not self-confirmation     Separate synthesis from critic
Human remains above the loop       Return, never seize, decision authority
Memory is intentionally governed   Keep only findings that survive audit
```

Parallax does not claim to guarantee truth or eliminate bias. It is designed to make directional drift easier to see
and harder to smuggle into a consequential verdict.

Read the full provenance and boundary statement in [`docs/LINEAGE.md`](docs/LINEAGE.md).

## Version

Current status: **v0.1.0 — Public Preview**.

See [`CHANGELOG.md`](CHANGELOG.md), [`RELEASE_NOTES-v0.1.0.md`](RELEASE_NOTES-v0.1.0.md), and the
[`validation report`](docs/VALIDATION.md).

## Contributing

Issues and bounded examples are welcome. Changes must preserve the validated-anchor requirement, mirrored bull/bear
attacks, independent critic, and human authority boundary. See [`CONTRIBUTING.md`](CONTRIBUTING.md).

## License

Parallax is licensed under [CC BY 4.0](LICENSE). You may share and adapt it with attribution to Antony Sovetcenkovs,
Parallax, and its EVO ZERO lineage.

---

Created by **Antony Sovetcenkovs** as part of the EVO ZERO lineage.
