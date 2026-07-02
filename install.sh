#!/bin/sh
set -eu

REPO_RAW="${PARALLAX_REPO_RAW:-https://raw.githubusercontent.com/EVOZERO-Antony/evo-zero-parallax/main/skills/parallax}"
PLATFORM="${1:-codex}"
TEMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TEMP_DIR"' EXIT HUP INT TERM

mkdir -p "$TEMP_DIR/source/agents"
curl -fsSL "$REPO_RAW/SKILL.md" -o "$TEMP_DIR/source/SKILL.md"
curl -fsSL "$REPO_RAW/agents/openai.yaml" -o "$TEMP_DIR/source/agents/openai.yaml"

test -s "$TEMP_DIR/source/SKILL.md"
test -s "$TEMP_DIR/source/agents/openai.yaml"
grep -q '^name: parallax$' "$TEMP_DIR/source/SKILL.md"

install_to() {
  target="$1"
  include_ui_metadata="$2"
  parent="$(dirname "$target")"
  stage="$TEMP_DIR/stage-$(echo "$target" | tr '/ ' '__')"

  mkdir -p "$stage" "$parent"
  cp "$TEMP_DIR/source/SKILL.md" "$stage/SKILL.md"

  if [ "$include_ui_metadata" = "yes" ]; then
    mkdir -p "$stage/agents"
    cp "$TEMP_DIR/source/agents/openai.yaml" "$stage/agents/openai.yaml"
  fi

  if [ -e "$target" ]; then
    backup="$target.backup.$(date +%Y%m%d%H%M%S)"
    mv "$target" "$backup"
    printf 'Existing installation backed up to %s\n' "$backup"
  fi

  mv "$stage" "$target"
  printf 'Installed Parallax to %s\n' "$target"
}

install_codex() {
  if [ -n "${CODEX_HOME:-}" ]; then
    install_to "$CODEX_HOME/skills/parallax" yes
  else
    install_to "$HOME/.agents/skills/parallax" yes
  fi
}

install_claude() {
  install_to "$HOME/.claude/skills/parallax" no
}

install_antigravity() {
  install_to "$HOME/.gemini/config/skills/parallax" no
}

case "$PLATFORM" in
  codex)
    install_codex
    ;;
  claude|claude-code)
    install_claude
    ;;
  antigravity)
    install_antigravity
    ;;
  all)
    install_codex
    install_claude
    install_antigravity
    ;;
  *)
    printf 'Usage: %s [codex|claude|antigravity|all]\n' "$0" >&2
    exit 2
    ;;
esac

printf 'Installation complete. Restart the target application if Parallax is not discovered immediately.\n'
