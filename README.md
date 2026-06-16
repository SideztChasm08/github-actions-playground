# GitHub Actions Playground 🎓

A hands-on, heavily-commented sandbox for learning **GitHub Actions** from
scratch. Each workflow in [.github/workflows/](.github/workflows/) is a
self-contained lesson — read the comments top to bottom, then run it and
watch what happens in the **Actions** tab.

## How to use this repo

1. Push this repo to GitHub (see [Getting started](#getting-started) below).
2. Open the **Actions** tab on GitHub.
3. Pick a workflow from the left sidebar (they're numbered in order).
4. Most are triggered manually: click **Run workflow** → watch the logs.
5. Open the workflow file alongside the run to connect *what you wrote* to
   *what happened*.

> Tip: read the YAML files in numbered order. Every line is commented to
> explain the concept, not just the syntax.

## The lessons

| # | File | What you'll learn |
|---|------|-------------------|
| 01 | [01-hello-world.yml](.github/workflows/01-hello-world.yml) | The smallest workflow: `name`, `on`, `jobs`, `steps`, `run` |
| 02 | [02-triggers.yml](.github/workflows/02-triggers.yml) | Events that start a workflow: `push`, `pull_request`, `schedule`, manual inputs |
| 03 | [03-jobs-and-actions.yml](.github/workflows/03-jobs-and-actions.yml) | Multiple jobs, `needs` dependencies, `actions/checkout`, running your own scripts |
| 04 | [04-matrix.yml](.github/workflows/04-matrix.yml) | Run one job across many OSes/versions with a `matrix` |
| 05 | [05-artifacts-and-outputs.yml](.github/workflows/05-artifacts-and-outputs.yml) | Pass data between jobs: step `outputs` vs uploaded `artifacts` |
| 06 | [06-env-and-secrets.yml](.github/workflows/06-env-and-secrets.yml) | `env` at workflow/job/step scope, and using `secrets` safely |
| 07 | [07-conditionals-and-concurrency.yml](.github/workflows/07-conditionals-and-concurrency.yml) | `if:` conditions, `success()`/`failure()`/`always()`, and `concurrency` |
| 08 | [08-caching.yml](.github/workflows/08-caching.yml) | Speed up runs by caching dependency folders with `actions/cache` |
| 09 | [09-reusable-caller.yml](.github/workflows/09-reusable-caller.yml) → [09-reusable-called.yml](.github/workflows/09-reusable-called.yml) | Define a workflow once (`workflow_call`) and reuse it with inputs/outputs |

The [scripts/](scripts/) folder holds the small shell scripts that lesson 03
runs (`build.sh`, `test.sh`).

## Mental model (the 30-second version)

```
Event (push, schedule, manual…)        ← "on:"
   └─ triggers a Workflow               ← one .yml file
        └─ which has one or more Jobs   ← run in parallel by default
             └─ each Job = a fresh VM (a "runner")   ← "runs-on:"
                  └─ runs Steps in order             ← "steps:"
                       └─ a Step either runs a shell command ("run:")
                          or a reusable Action ("uses:")
```

Key things that trip up beginners:

- **Jobs run on separate machines.** Files created in one job do **not**
  exist in another. To share data, use step **outputs** (small values) or
  **artifacts** (files) — that's lesson 05.
- **Runners start fresh every run.** Nothing persists unless you cache it
  (lesson 08) or upload it as an artifact.
- **`uses:` vs `run:`** — `run:` executes a shell command; `uses:` pulls in
  a prebuilt action (like `actions/checkout`).

## Getting started

This folder isn't a git repo yet. To put it on GitHub:

```bash
cd github-actions-playground
git init
git add .
git commit -m "GitHub Actions learning playground"

# Create the repo on GitHub (needs the gh CLI), or do it via the website:
gh repo create github-actions-playground --public --source=. --push
```

Then open the repo's **Actions** tab and start running the workflows.

### Optional: try the secrets lesson

Lesson 06 looks for a secret named `MY_API_KEY`. It works without one, but to
see masking in action: repo **Settings → Secrets and variables → Actions →
New repository secret**, name it `MY_API_KEY`, give it any value.

## Where to go next

- Official docs: https://docs.github.com/actions
- Marketplace (prebuilt actions): https://github.com/marketplace?type=actions
- Workflow syntax reference: https://docs.github.com/actions/using-workflows/workflow-syntax-for-github-actions
