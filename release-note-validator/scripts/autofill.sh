#!/usr/bin/env bash
#
# autofill.sh
#
# Prepends `release-note: NONE` to a PR body when the PR title starts with
# a cleanup-style prefix (chore, refactor, test, docs, ci, build).
#
# Behaviour:
#   - If PR body already contains a `release-note:` line → do nothing (no overwrite)
#   - If PR title does NOT start with a cleanup prefix → do nothing
#   - Otherwise → prepend `release-note: NONE` as the first line of the PR body

set -euo pipefail

# Fetch current PR body
body=$(gh api "repos/${REPO}/pulls/${PR_NUM}" --jq '.body // ""')

# Skip if release-note: already present anywhere in the body (allow leading whitespace)
if printf '%s' "$body" | grep -qE '^[[:space:]]*release-note:'; then
  echo "release-note: already present in PR body, skipping autofill"
  exit 0
fi

# Skip if title does not match cleanup prefixes.
# Matches: chore:, refactor:, test:, docs:, ci:, build:
# Also matches scoped variants like chore(deps):, refactor(iam):
if ! printf '%s' "$PR_TITLE" | grep -qE '^(chore|refactor|test|docs|ci|build)(\([^)]*\))?:'; then
  echo "Title prefix not in autofill list, skipping"
  exit 0
fi

# Prepend release-note: NONE as the FIRST line of the body
new_body=$(printf 'release-note: NONE\n\n%s' "$body")

gh api "repos/${REPO}/pulls/${PR_NUM}" \
  --method PATCH \
  --field body="$new_body" > /dev/null

echo "✓ Auto-added 'release-note: NONE' to PR #${PR_NUM}"
