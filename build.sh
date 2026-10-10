#!/usr/bin/env bash
# build.sh — rebuild the static site; with --push, commit & push to trigger the Pages deploy.
#
# Usage:
#   ./build.sh          rebuild dist/ (skipped if nothing changed since last commit)
#   ./build.sh --push   build, commit changes, push to origin (GitHub Actions deploys)
#
# Notes:
#   - The résumé symlink (Alex_Marquez_Resume.pdf) is never committed.
#   - Push requires the SSH key loaded in your agent: ssh-add ~/.ssh/id_rsa
#   - Local preview after a build: npm run preview  (http://localhost:4321)
set -euo pipefail
cd -- "$(dirname -- "$0")"

CHANGED=$(git status --porcelain -- src public astro.config.mjs package.json tsconfig.json .github 2>/dev/null || true)

if [[ -d dist && -z "$CHANGED" ]]; then
  echo "up to date — nothing changed, skipping build"
else
  npm run build
  du -sh dist
fi

if [[ "${1:-}" != "--push" ]]; then
  exit 0
fi

git add -A -- . ':!Alex_Marquez_Resume.pdf'

if git diff --cached --quiet; then
  echo "nothing new to deploy"
  exit 0
fi

git commit -m "site: $(date -u +%Y-%m-%dT%H:%M)Z"

if ! GIT_SSH_COMMAND="ssh -o BatchMode=yes -o ConnectTimeout=10" git push; then
  echo "push failed — is the key loaded? (ssh-add ~/.ssh/id_rsa)" >&2
  exit 1
fi
echo "pushed — the GitHub Actions workflow is deploying"
