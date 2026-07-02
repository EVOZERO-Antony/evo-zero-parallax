#!/bin/sh
set -eu

REPO_RAW="https://raw.githubusercontent.com/EVOZERO-Antony/evo-zero-parallax/main/skills/parallax"

if [ -n "${CODEX_HOME:-}" ]; then
  SKILLS_HOME="$CODEX_HOME/skills"
else
  SKILLS_HOME="$HOME/.agents/skills"
fi

TARGET="$SKILLS_HOME/parallax"
TEMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TEMP_DIR"' EXIT HUP INT TERM

mkdir -p "$TEMP_DIR/parallax/agents" "$SKILLS_HOME"
curl -fsSL "$REPO_RAW/SKILL.md" -o "$TEMP_DIR/parallax/SKILL.md"
curl -fsSL "$REPO_RAW/agents/openai.yaml" -o "$TEMP_DIR/parallax/agents/openai.yaml"

test -s "$TEMP_DIR/parallax/SKILL.md"
test -s "$TEMP_DIR/parallax/agents/openai.yaml"
grep -q '^name: parallax$' "$TEMP_DIR/parallax/SKILL.md"

if [ -e "$TARGET" ]; then
  BACKUP="$TARGET.backup.$(date +%Y%m%d%H%M%S)"
  mv "$TARGET" "$BACKUP"
  printf 'Existing installation backed up to %s\n' "$BACKUP"
fi

mv "$TEMP_DIR/parallax" "$TARGET"
printf 'Parallax installed to %s\n' "$TARGET"
printf 'Restart Codex if needed, then invoke: Use $parallax to pressure-test this decision.\n'
