#!/usr/bin/env bash
# A pretend "test" script.
#
# NOTE: in workflow 03, "build" and "test" are SEPARATE jobs, which means
# they run on SEPARATE machines. Files created by build.sh do NOT exist
# here — that's why this test is self-contained and re-creates/checks its
# own state. (Passing files between jobs is what artifacts are for; see
# workflow 05.)

set -euo pipefail

echo "🧪 Running tests..."

# Re-run the build here so we have something to test against, independent
# of the other job.
bash scripts/build.sh

if [[ -f build/app.txt ]]; then
  echo "✅ Found build/app.txt — test passed."
else
  # Exiting non-zero tells GitHub Actions the step FAILED,
  # which fails the job (and any jobs that 'needs' it).
  echo "❌ build/app.txt is missing — test failed."
  exit 1
fi
