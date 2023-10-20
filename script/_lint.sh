#!/bin/sh

# script/_lint: Run our code linters
# This should be run within the docker container, not on your on laptop

set -e

cd "$(dirname "$0")/.."

RED="\033[0;31m"
NC='\033[0m' # No Color

if [ "$LINT_ALL" = "true" ]; then
  git config --global http.proxy http://kraken02.oit.umn.edu:3128
  git config --global https.proxy https://kraken02.oit.umn.edu:3128
  echo "==> Checking Gems..."
  echo "==> ${RED}NOTE: Several CVES are being ignored in .bundler-audit.yml. Remove them once we've upgraded Rails.${NC}"
  bundle audit check --update
  echo "==> Running Brakeman..."
  brakeman
  echo "==> Running Reek..."
  reek
  echo "==> Running Standard..."
  standardrb --no-fix
else
  echo "==> Checking Gems..."
  echo "==> ${RED}NOTE: Several CVES are being ignored in .bundler-audit.yml. Remove them once we've upgraded Rails.${NC}"
  bundle audit check --update
  echo "==> Running Reek..."
  reek $(git diff --name-only --ignore-submodules=all --cached) --force-exclusion
  echo "==> Running Standard..."
  standardrb --no-fix
fi
