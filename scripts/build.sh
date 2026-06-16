#!/usr/bin/env bash
# A pretend "build" script.
# In a real project this might compile code, bundle assets, etc.
# Here we just print something and create a file so 'test.sh' has
# something to look at.

set -euo pipefail   # fail fast: error on any failed command or unset variable

echo "🔨 Building the project..."
mkdir -p build
echo "artifact v1" > build/app.txt
echo "✅ Build complete. Wrote build/app.txt"
