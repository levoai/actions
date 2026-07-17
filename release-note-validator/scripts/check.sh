#!/usr/bin/env bash
#
# check.sh
#
# Verifies that a PR body contains a line starting with `release-note:`.
# Fails the calling job (exit 1) if the line is missing.
#
# Accepted forms (validated as "line exists" only — content is free-form):
#   release-note: NONE
#   release-note: <one-line customer-facing summary>
#   release-note: BREAKING: <summary describing the upgrade procedure>

set -euo pipefail

# Fetch PR body
body=$(gh api "repos/${REPO}/pulls/${PR_NUM}" --jq '.body // ""')

# release-note: line must exist (allow leading whitespace for indented Markdown)
if ! grep -qE '^[[:space:]]*release-note:' <<< "$body"; then
  echo "::error::Missing 'release-note:' block in PR description."
  echo "::notice::Add ONE of the following lines to your PR description:"
  echo "::notice::  release-note: NONE"
  echo "::notice::  release-note: <one-line customer-facing summary>"
  echo "::notice::  release-note: BREAKING: <summary + upgrade procedure>"
  exit 1
fi

echo "✓ release-note: line found"
