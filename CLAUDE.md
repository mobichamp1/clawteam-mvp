# ClawTeam MVP — Backend Developer Workspace

## Overview

This workspace (`mobichamp1/clawteam-mvp`) is the product repo for ClawTeam.
Board confirmed: **fork-and-extend** HKUDS/ClawTeam.

## Branches

- `main` — upstream HKUDS/ClawTeam v0.3.0 (current active branch)
- `main-landing` — old static landing page (archived, superseded by upstream React website)

## Repository

- **GitHub:** https://github.com/mobichamp1/clawteam-mvp
- **Upstream:** https://github.com/HKUDS/ClawTeam (5,350 stars, active May 2026)

## Installing

```bash
pip install -e .
clawteam --version  # v0.3.0
```

## Key Commands

```bash
clawteam template list         # Show builtin templates
clawteam launch hedge-fund -g "Analyze AAPL"  # Launch template (needs tmux)
clawteam board serve          # Start web UI dashboard (port 8080)
clawteam board serve --port 8081  # Alternative port
clawteam run claude "task"    # Wrap a CLI agent with lifecycle management
clawteam spawn tmux --agent-name foo --task "do stuff"
clawteam workspace list
```

## Architecture (from upstream)

- `clawteam/` — Python package (typer CLI, pydantic models, rich TUI)
- `clawteam/spawn/` — Agent spawning (tmux, subprocess backends)
- `clawteam/board/` — Kanban task board (file-based, web UI)
- `clawteam/workspace/` — Git worktree isolation
- `clawteam/harness/` — Plan-then-execute orchestration
- `clawteam/templates/` — TOML team archetypes (hedge-fund, software-dev, etc.)
- `clawteam/mcp/` — MCP server (`clawteam-mcp`)
- `website/` — React web UI (Vite, deployed separately)

## Fork Status (CLAA-47 ✅ COMPLETE)

**HKUDS/ClawTeam forked to:** https://github.com/mobichamp1/ClawTeam

The fork inherits the upstream name (`ClawTeam`, not `clawteam-mvp`). Cherry-picked from `clawteam-mvp`:
- `30d08f3` — docs: update deployment status
- `289eab4` — Fix install.sh, README, and landing page links to point to HKUDS/ClawTeam

Pushed: `0119833..289eab4 main -> main` on mobichamp1/ClawTeam

**clawteam-mvp** remains a separate landing-page-only repo at mobichamp1.github.io/clawteam-mvp/.

## MVP Extension Plan (CLAA-42 children)

### CLAA-47 ✅ Done — Fork HKUDS/ClawTeam to mobichamp1
Completed: mobichamp1/ClawTeam is live.

### CLAA-48 (Frontend)
Adapt upstream React `website/` to mobichamp1 branding.

### Future extensions
- MCP server tools for Claude Code / OpenClaw integration
- Workspace sync between ClawTeam and agent IDEs

## Status

- CLAA-42 Phase 1: ✅ Done
- CLAA-47: ✅ Done (forked to mobichamp1/ClawTeam)
- CLAA-48: Pending
