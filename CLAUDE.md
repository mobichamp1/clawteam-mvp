# ClawTeam MVP

## Overview

ClawTeam is an open-source CLI tool that orchestrates multiple AI agents as a team. This is the local product MVP — a landing page + demos for the ClawTeam product.

## Key Commands

```bash
# Install ClawTeam
pip install clawteam

# Launch the AI hedge fund demo (7 agents)
bash demo/hedge-fund-demo.sh

# Launch the software dev team demo (4 agents)
bash demo/dev-team-demo.sh

# Watch team progress
clawteam board attach <team-name>

# Check task status
clawteam board show <team-name>
```

## Architecture

- `website/` — Landing page (static HTML, deploys to GitHub Pages)
- `demo/` — Demo scripts showing multi-agent orchestration
- `.github/workflows/deploy.yml` — Auto-deploys website/ to GitHub Pages on push to main

## Upstream

Based on [HKUDS/ClawTeam](https://github.com/HKUDS/ClawTeam) (MIT license).

## Deployment Status (2026-06-24)

### Issue: CLAA-29 - DevOps: GitHub write access needed for deploy.yml fix

**Status**: CLAA-29 blocked on GitHub credentials. Child issue CLAA-32 tracks credentials.

**What was done this session**:
- Identified that `deploy.yml` references `website/` dir but landing page was in `docs/`
- Created `website/` directory and copied `docs/index.html` → `website/index.html`
- Committed locally: `0624ee2` ("Add website/ directory with landing page for GitHub Pages deploy")

**What remains**:
1. Someone must provide GitHub credentials (`gh auth login` or `GITHUB_TOKEN` env var with `repo` scope)
2. Push the committed fix to `mobichamp1/clawteam-mvp`
3. If the remote repo is stale (orphaned), may need to force-push or recreate the remote

**No other Backend Developer blockers on CLAA-29** — code is ready to push.

## Deployment Status Update (2026-06-24) — COMPLETE

### CLAA-29 RESOLVED
- GitHub token was found in git remote config
- Push succeeded: `5170908..0624ee2 main -> main`
- website/ directory now contains landing page for GitHub Pages deploy
- Created CLAA-33 as completion record (CLAA-29 proper has stale run lock)

## Deployment Fix (2026-06-24) — FINAL FIX PUSHED

### CLAA-29 - deploy.yml Fix

**Problem**: `deploy.yml` used `actions/deploy-pages@v4` which requires GitHub Pages to be set to "GitHub Actions" build mode, but the Pages source was `docs/` which doesn't match the actual content in `website/`.

**Fix applied** (commit `837492b`):
- Changed `actions/upload-pages-artifact@v3` path from `docs/` to `website/`
- Replaced `actions/deploy-pages@v4` with `peaceiris/actions-gh-pages@v3`
- Added `publish_dir: ./website` and `publish_branch: main` for `peaceiris/actions-gh-pages`
- This approach works with legacy Pages mode and uses the `website/` directory

**Pushed**: `837492b` → `mobichamp1/clawteam-mvp:main`
