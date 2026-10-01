#!/usr/bin/env bash
# bake.sh: re-vendor the coach brain into the plugin and run governance checks.
#
# Usage:
#   tools/bake.sh [path-to-local-corner-coach-brain] [--gpt]
#
# With no path, clones the public brain repo into a temp dir.
# --gpt additionally emits concatenated knowledge bundles for a Custom GPT
# (max 20 files) into dist/gpt-knowledge/.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DEST="$REPO_ROOT/plugin/skills/performance-coach/references/brain"
BRAIN_REPO="https://github.com/Rapport-Score-LLC/corner-coach-brain.git"

# Known banned-token violations, tracked in listing/submission-checklist.md.
# Remove entries here once fixed upstream.
KNOWN_ISSUES=(
  "coaching/training-curriculum-map.md"
  "coaching/receipt-to-inner-driver.md"
)

SRC=""
GPT=0
for arg in "$@"; do
  case "$arg" in
    --gpt) GPT=1 ;;
    *) SRC="$arg" ;;
  esac
done

TMP=""
if [[ -z "$SRC" ]]; then
  TMP="$(mktemp -d)"
  trap 'rm -rf "$TMP"' EXIT
  echo "Cloning $BRAIN_REPO ..."
  git clone --quiet --depth 1 "$BRAIN_REPO" "$TMP/brain"
  SRC="$TMP/brain"
fi

[[ -f "$SRC/APC-SYSTEM-PROMPT.md" ]] || { echo "ERROR: $SRC is not the coach brain"; exit 1; }

echo "Vendoring bake set into plugin ..."
rsync -a --delete \
  --exclude='.git' --exclude='_meta' --exclude='.DS_Store' \
  --exclude='README.md' --exclude='.gitignore' \
  "$SRC/" "$DEST/"

fail=0

# Check 1: no _meta leaked
if [[ -d "$DEST/_meta" ]]; then echo "FAIL: _meta/ leaked into plugin"; fail=1; fi

# Check 2: em dash (U+2014) anywhere in the plugin
if grep -rl "$(printf '\xe2\x80\x94')" "$REPO_ROOT/plugin" 2>/dev/null; then
  echo "FAIL: em dash found in the files above"; fail=1
fi

# Check 3: banned tokens in the vendored brain (outside known issues).
# The contract and host adapters state the ban itself, so they may name
# the tokens; anywhere else is a violation.
check_token() {
  local label="$1" pattern="$2" unexpected="" f known k
  for f in $(cd "$DEST" && grep -rliE "$pattern" --include='*.md' . | sed 's|^\./||' | sort); do
    known=0
    case "$f" in
      APC-SYSTEM-PROMPT.md|CHATGPT.md|FOR-CURSOR.md|FOR-CLAUDE.md|FOR-AGENTS.md|GROK.md) known=1 ;;
    esac
    for k in "${KNOWN_ISSUES[@]}"; do [[ "$f" == "$k" ]] && known=1; done
    [[ $known -eq 0 ]] && unexpected="$unexpected $f"
  done
  if [[ -n "$unexpected" ]]; then
    echo "FAIL: new '$label' uses:$unexpected"; return 1
  fi
  return 0
}
check_token "AI-powered" "AI-powered" || fail=1
check_token "diagnos*" "diagnos" || fail=1
echo "NOTE: known banned-token issues still present upstream:"
printf '  %s\n' "${KNOWN_ISSUES[@]}"

# Check 4: file hygiene (directory limits: text only, <256 KiB, <=512 files)
big="$(find "$REPO_ROOT/plugin" -type f -size +255k || true)"
if [[ -n "$big" ]]; then echo "FAIL: files over 256 KiB:"; echo "$big"; fail=1; fi
count="$(find "$REPO_ROOT/plugin" -type f | wc -l | tr -d ' ')"
echo "Plugin file count: $count (limit 512)"
[[ "$count" -le 512 ]] || { echo "FAIL: too many files"; fail=1; }
find "$REPO_ROOT/plugin" -name '.DS_Store' -delete

# Optional: Custom GPT knowledge bundles (one file per folder + roots)
if [[ $GPT -eq 1 ]]; then
  OUT="$REPO_ROOT/dist/gpt-knowledge"
  rm -rf "$OUT"; mkdir -p "$OUT"
  cp "$DEST/APC-SYSTEM-PROMPT.md" "$OUT/00-APC-SYSTEM-PROMPT.md"
  cp "$DEST/Home.md" "$OUT/01-Home.md"
  i=2
  for d in measurements dimensions belts coaching faq safety research; do
    [[ -d "$DEST/$d" ]] || continue
    bundle="$OUT/$(printf '%02d' $i)-$d.md"
    : > "$bundle"
    find "$DEST/$d" -name '*.md' | sort | while read -r f; do
      printf '\n\n<!-- %s -->\n\n' "${f#"$DEST"/}" >> "$bundle"
      cat "$f" >> "$bundle"
    done
    i=$((i+1))
  done
  echo "GPT bundles: $(ls "$OUT" | wc -l | tr -d ' ') files in dist/gpt-knowledge/"
fi

if [[ $fail -eq 0 ]]; then
  echo "Bake OK. Next: bump plugin version, run 'claude plugin validate ./plugin', commit."
else
  echo "Bake FAILED. Fix the findings above before committing."
  exit 1
fi
