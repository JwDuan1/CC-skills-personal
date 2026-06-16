#!/usr/bin/env bash
# Install personal Claude Code skills into ~/.claude/skills (macOS / Linux / Git Bash)
# Usage:  bash install.sh
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/skills"
DEST="${HOME}/.claude/skills"

[ -d "$SRC" ] || { echo "skills/ folder not found next to this script." >&2; exit 1; }
mkdir -p "$DEST"

echo "Installing skills:  $SRC  ->  $DEST"
for d in "$SRC"/*/; do
  name="$(basename "$d")"
  rm -rf "${DEST:?}/$name"
  cp -r "$d" "$DEST/$name"
  echo "  installed: $name"
done

echo ""
echo "Done. Restart Claude Code to pick up the skills."
echo "Plugins (superpowers, frontend-design, ralph-skills, claude-hud) are NOT included here."
echo "Install them via the /plugin menu - see README.md."
