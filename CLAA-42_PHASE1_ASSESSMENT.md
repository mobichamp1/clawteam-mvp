# CLAA-42 Phase 1 Assessment: Upstream & Workspace State

**Issue:** CLAA-42 — Build Clawteam MVP — Phase 1: Upstream assessment and running state
**Date:** 2026-06-25
**Agent:** Backend Developer (e1d52c37-a88f-4b21-ad92-38c50eaba22c)

---

## 1. Upstream Repository: HKUDS/ClawTeam

**URL:** https://github.com/HKUDS/ClawTeam
**Stars:** 5,350 | **Last pushed:** 2026-05-09 | **Language:** Python

### Tech Stack
- **CLI:** Python 3.10+, built with `typer`, `pydantic`, `rich`, `questionary`
- **Package:** `clawteam` (v0.3.0) — pip-installable
- **Web UI:** React (Vite) — separate `website/` directory
- **Templates:** hedge-fund, software-dev, research-paper, strategy-room, code-review, harness-default
- **Agent skills:** `.agents/skills/clawteam-dev/`, `.agents/skills/frontend-design/`
- **Transport:** file-based (default), ZeroMQ P2P (optional), Redis (optional)

### Core Architecture
The upstream is a genuine framework:
- `clawteam/spawn/` — agent spawning (git worktrees + tmux)
- `clawteam/board/` — kanban-style task board with file-based inbox
- `clawteam/transport/` — messaging between agents (file, ZMQ, redis)
- `clawteam/harness/` — agent harness configuration
- `clawteam/templates/` — TOML team archetype definitions

### README Features vs. Reality
The README claims tmux integration, git worktree isolation, and inter-agent messaging. The codebase is real and active as of May 2026.

---

## 2. Our Workspace: mobichamp1/clawteam-mvp

**URL:** https://github.com/mobichamp1/clawteam-mvp
**Stars:** 0 | **Last pushed:** 2026-06-24 | **Language:** HTML

### What Exists
- `website/index.html` — static landing page (288 lines, dark theme, feature grid, AI hedge fund demo)
- `demo/dev-team-demo.sh`, `demo/hedge-fund-demo.sh` — simulated demo scripts (text output only, no real agents)
- `CLAUDE.md`, `README.md` — workspace documentation

### What Does NOT Exist
- No Python `clawteam` package installed or published
- No real agent spawning mechanism
- No tmux integration
- No kanban/task board
- No git worktree automation
- No React web app

**Assessment:** The workspace is a static marketing page with scripted fake demos. It has no actual product.

---

## 3. MVP Scope Recommendation

Given the gap between our workspace and the upstream, the real MVP should be:

### Phase 1: Fork & Integrate (Backend Developer)
1. Fork HKUDS/ClawTeam → mobichamp1/clawteam-mvp
2. Install upstream locally: `pip install clawteam`
3. Run existing templates (e.g., `clawteam launch hedge-fund`) to verify it works
4. Extend with MCP server (`clawteam-mcp`) for native Claude Code / OpenClaw integration
5. Publish our fork as the mobichamp1 enhanced version

### Phase 1: Product Website (Frontend Developer)
1. Replace static HTML landing page with upstream's React website as base
2. Add live demo section — real `clawteam launch` output, not scripted text
3. Add pricing/CTA if applicable
4. Deploy to GitHub Pages

### Phase 2: Custom Templates & Branding
- Our own branded templates on top of upstream's framework

---

## 4. Recommended Immediate Next Steps

1. **Backend Developer:** Fork the upstream repo, install `clawteam`, run the hedge-fund template end-to-end, document what works and what needs extension.
2. **Frontend Developer:** Take the upstream `website/` React app, adapt it to our branding, add live demo section.
3. **Decision needed:** Should we extend the upstream framework or build our own? Extending is faster; our own gives full control.

---

## 5. Blocker

None for Phase 1 assessment. Execution can proceed once the board confirms the fork/extend approach.
