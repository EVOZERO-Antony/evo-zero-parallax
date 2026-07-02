# Publishing Parallax on GitHub

## 1. Make four author decisions

Before publishing, choose:

1. **Repository owner and name:** recommendation `evo-zero-parallax` so the lineage is visible at first contact.
2. **License:** CC BY 4.0 selected for v0.1.0.
3. **Contact:** add a private security/reporting email or enable GitHub private vulnerability reporting.
4. **Public parent link:** add the canonical EVO ZERO URL when it exists; do not point readers to private doctrine files.

## 2. Finalize local metadata

- Replace any missing contact and repository URLs.
- Confirm the `LICENSE`, README, and CITATION metadata remain aligned.
- Confirm the author spelling and release date.
- Run the validation commands in section 4.

## 3. Create and push the repository

From the `Parallax-GitHub` directory:

```bash
git init
git add .
git commit -m "Release Parallax skill v0.1.0"
git branch -M main
gh repo create evo-zero-parallax --public --source=. --remote=origin --push \
  --description "An EVO ZERO decision instrument for pressure-testing verdicts across abstraction levels and mirrored bull/bear attacks."
```

If GitHub CLI is unavailable, create an empty public repository in the GitHub UI, then run:

```bash
git remote add origin https://github.com/OWNER/evo-zero-parallax.git
git push -u origin main
```

## 4. Validate before tagging

```bash
python3 /path/to/skill-creator/scripts/quick_validate.py skills/parallax
git status --short
```

Open the public README and test every relative link. Install the skill from the clean repository into a fresh skills
directory and run one realistic decision test.

## 5. Create the first release

```bash
git tag -a v0.1.0 -m "Parallax v0.1.0"
git push origin v0.1.0
gh release create v0.1.0 --title "Parallax v0.1.0 — Public Preview" \
  --notes-file RELEASE_NOTES-v0.1.0.md --verify-tag --prerelease
```

Attach no zip manually unless a consumer requires it; GitHub generates source archives for every tag.

The command forms above are documented by the official GitHub CLI manuals for
[`gh repo create`](https://cli.github.com/manual/gh_repo_create) and
[`gh release create`](https://cli.github.com/manual/gh_release_create).

## 6. Configure the GitHub page

- **Description:** `An EVO ZERO decision instrument for pressure-testing verdicts across abstraction levels and mirrored bull/bear attacks.`
- **Topics:** `ai`, `decision-making`, `metacognition`, `human-ai`, `reasoning`, `red-team`, `codex-skills`, `evo-zero`.
- Enable Issues, Discussions, private vulnerability reporting, and branch protection for `main`.
- Pin the repository on the author's profile after the first release.

## 7. Release discipline

- Patch (`0.1.x`): wording, examples, fixes that preserve behavior.
- Minor (`0.x.0`): backward-compatible new modes or output fields.
- Major (`x.0.0`): changes to fixpoint, grid, critic, or authority semantics.
- Update `VERSION`, `CHANGELOG.md`, `CITATION.cff`, release notes, and tag together.
