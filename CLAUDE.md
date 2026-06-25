# ClawTeam MVP

## Overview

ClawTeam is an open-source CLI tool that orchestrates multiple AI agents as a team. This repo (`mobichamp1/clawteam-mvp`) is the local product — fork of HKUDS/ClawTeam with our custom branding and MCP server extension for Claude Code / OpenClaw.

## Repositories

- **Product repo (fork):** `mobichamp1/ClawTeam` — fork of HKUDS/ClawTeam, ships the actual Python CLI
- **Landing page repo:** `mobichamp1/clawteam-mvp` — GitHub Pages landing page + demo scripts

## Key Commands

```bash
# Install ClawTeam (from our fork)
pip install git+https://github.com/mobichamp1/ClawTeam.git

# Or install from upstream
pip install clawteam

# Launch the AI hedge fund demo (7 agents)
clawteam launch hedge-fund --team-name my-hedge-fund

# Watch team progress
clawteam team status <team-name>

# Block until all tasks complete
clawteam task wait <team-name>
```

## Architecture

- `ClawTeam/` — Forked product repo (Python CLI, MCP server, React web UI)
- `website/` (in clawteam-mvp) — Landing page source
- `docs/` (build output) — Compiled landing page + assets
- `.github/workflows/deploy.yml` — Auto-deploys docs/ to GitHub Pages (gh-pages branch)

## Deployment Status

### Landing Page (clawteam-mvp)
- **URL:** https://mobichamp1.github.io/clawteam-mvp/
- **Source:** `ClawTeam/docs/` (built from upstream React app)
- **Deploy:** Pushes to `gh-pages` branch via `peaceiris/actions-gh-pages@v3`
- **Status:** ✅ Live

### MCP Server (in ClawTeam fork)
The fork includes a full MCP server at `clawteam/mcp/` with tools:
- `board_overview`, `board_team` — team board summaries
- `task_list`, `task_get`, `task_create`, `task_update` — task management
- `team_status`, `team_snapshot` — team state
- `inbox_messages`, `inbox_send` — agent messaging
- `workspace_list`, `workspace_run` — workspace operations
- `cost_summary` — budget tracking

## CLAA-42 — Phase 2: Fork and Running State (2026-06-25)

### Board Decision
**Fork-and-extend** was confirmed by board. mobichamp1/ClawTeam is now forked from HKUDS/ClawTeam.

### Phase 2 Actions Taken

**Fork created:** `mobichamp1/ClawTeam` forked from `HKUDS/ClawTeam`
- 5 upstream branches tracked: main, feat/desktop, feat/profile, feat/gource-acpx-context, open-harness

**clawteam v0.3.0 installed from fork:**
```
pip install -e ClawTeam/  # installed from /home/niek/.../ClawTeam
```

**End-to-end demo verified:** `clawteam launch hedge-fund --team-name hf-fork-test`
- 7 agents spawned (portfolio-manager, buffett-analyst, growth-analyst, technical-analyst, fundamentals-analyst, sentiment-analyst, risk-manager)
- All agents registered with tmux backend
- Tasks created and tracked in kanban board

**Landing page build verified:** `npm run build` in ClawTeam/ → `docs/`
- Builds to 158KB JS + 11KB CSS + 835KB icon
- React app with animated globe, agent orbit visualization, terminal mockup

### Phase 2 Remaining (Delegated)

**Frontend Developer next steps:**
1. Copy `ClawTeam/docs/` built assets to `clawteam-mvp/website/` or adapt `deploy.yml` to build from ClawTeam/
2. Update `website/index.html` links to point to `mobichamp1/ClawTeam` (from HKUDS/ClawTeam)
3. Deploy updated landing page

**Backend Developer (MCP extension):**
1. Extend `clawteam/mcp/tools/` with Claude Code / OpenClaw-specific tools
2. Test MCP server with Claude Code: `clawteam mcp start`
3. Add workspace sync between ClawTeam and Claude Code projects

### Push Status
- `da18146` pushed to `mobichamp1/clawteam-mvp` ✅
- `ClawTeam/` fork cloned locally at `~/.../ClawTeam/`
