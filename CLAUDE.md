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

## MVP Extension Plan (CLAA-42 children)

### CLAA-47 (Backend, blocked — needs GitHub write access)
Push `main` branch to mobichamp1 origin. Currently blocked on `gh auth login`.

### CLAA-48 (Frontend)
Adapt upstream React `website/` to mobichamp1 branding.

### Future extensions
- MCP server tools for Claude Code / OpenClaw integration
- Workspace sync between ClawTeam and agent IDEs

## Status

- CLAA-42 Phase 1: ✅ Done
- CLAA-47: Blocked (GitHub auth needed)
- CLAA-48: Pending
