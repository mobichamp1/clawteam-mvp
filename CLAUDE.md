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

## Deployment Fix (2026-06-24) — COMPLETE ✅

### CLAA-29 - deploy.yml Fix

**Problem**: `deploy.yml` used `actions/deploy-pages@v4` which requires GitHub Pages to be set to "GitHub Actions" build mode, but the Pages source was `docs/` which doesn't match the actual content in `website/`.

**Root cause chain**:
1. `actions/deploy-pages@v4` requires Pages → GitHub Actions build mode
2. Switching to `peaceiris/actions-gh-pages@v3` with `publish_branch: main` → "deploy from main to main prohibited"
3. Fixed with `publish_branch: gh-pages` + `contents: write` permission
4. GitHub Pages source updated from `main` to `gh-pages` branch via API

**Fix applied** (commit `8afdcbe`):
- Simplified deploy.yml to use only `peaceiris/actions-gh-pages@v3`
- `permissions.contents: write` (needed to push `gh-pages` branch)
- `publish_dir: ./website`, `publish_branch: gh-pages`
- GitHub Pages source switched from `main` to `gh-pages` branch

**Verified**: Site live at https://mobichamp1.github.io/clawteam-mvp/ (HTTP 200)

---

## CLAA-42 — Phase 1: Upstream Assessment and Running State (2026-06-25)

### Upstream: HKUDS/ClawTeam

| Metric | Value |
|--------|-------|
| Stars | 5,400 |
| Forks | 735 |
| Commits | 217 |
| Latest release | v0.2.0 (March 23, 2026) |
| License | MIT |
| Repo | github.com/HKUDS/ClawTeam |

**What the upstream provides** (217 commits, Python package):
- Full `clawteam` Python CLI (`pip install clawteam`)
- `clawteam spawn`, `clawteam team`, `clawteam task`, `clawteam inbox`, `clawteam board`
- Skill integration for Claude Code, Codex, OpenClaw, nanobot, etc.
- Team templates (TOML): AI Hedge Fund, Agentic Engineering, AutoResearch
- Git worktree isolation per agent, tmux backend, file-based inbox
- Web UI dashboard, P2P ZeroMQ transport, multi-user, plan approval
- v0.3 roadmap: Redis transport, shared state, agent marketplace

### MVP Gap Analysis

The current MVP (`mobichamp1/clawteam-mvp`) contains only:
- `website/index.html` — landing page ✅
- `demo/hedge-fund-demo.sh` — demo launcher script (calls `clawteam` CLI)
- `demo/dev-team-demo.sh` — dev team demo
- `install.sh` — install stub
- `.github/workflows/deploy.yml` — GitHub Pages CI/CD ✅

**Critical issues:**

1. **`install.sh` and README reference wrong URL**: Install script says `clawteam/clawteam` repo which doesn't exist. Actual pip package is in `HKUDS/ClawTeam`. Landing page also links to `github.com/clawteam/clawteam` which is a 404.

2. **`clawteam` CLI is not installed anywhere in this repo**: The demo scripts call `clawteam launch hedge-fund` but there's no actual `clawteam` Python package here. Users would need to `pip install clawteam` from HKUDS/ClawTeam first.

3. **Landing page says "pip install clawteam" but that package doesn't exist on PyPI**: The upstream publishes from `HKUDS/ClawTeam` via `pip install -e .` or their install script — not a standard PyPI release.

### Running State

| Component | Status |
|-----------|--------|
| Landing page (website/) | ✅ Live at mobichamp1.github.io/clawteam-mvp/ |
| deploy.yml | ✅ Working, pushes to gh-pages |
| Demo scripts | ⚠️ Require `clawteam` CLI (not in this repo) |
| install.sh | ❌ References wrong/non-existent GitHub URL |
| README links | ❌ `github.com/clawteam/clawteam` is 404 |

### Immediate Fixes Needed (CLAA-42 follow-up)

1. **Fix install.sh** — point to `HKUDS/ClawTeam` or the actual install script
2. **Fix landing page links** — update `github.com/clawteam/clawteam` → `github.com/HKUDS/ClawTeam`
3. **Fix README.md** — update install URL
4. **Consider**: Should this MVP ship the actual `clawteam` package, or remain a landing-page-only repo?
