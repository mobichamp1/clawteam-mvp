# ClawTeam MVP

> Local product landing page + demo for ClawTeam — Agent Swarm Intelligence

## What's Inside

| Path | Description |
|------|-------------|
| `website/` | Static landing page (`index.html`) |
| `install.sh` | One-line install script |
| `demo/` | Demo scripts to showcase multi-agent orchestration |

## Quick Start

```bash
# Install ClawTeam
git clone https://github.com/mobichamp1/ClawTeam.git /tmp/clawteam-src
cd /tmp/clawteam-src && pip install -e .

# Launch the landing page
open website/index.html
# Or serve it:
python -m http.server 8080 --directory website

# Run a demo
bash demo/hedge-fund-demo.sh
```

## Demos

### AI Hedge Fund (7-Agent Team)
```bash
bash demo/hedge-fund-demo.sh
```
Spins up: portfolio-manager + 5 analysts + risk-manager.

### Software Dev Team
```bash
bash demo/dev-team-demo.sh
```
Spins up: architect + backend + frontend + tester.

## Requirements

- Python 3.10+
- tmux
- A CLI agent (Claude Code, Codex, OpenClaw, nanobot, etc.)

## Docs

Full documentation: [https://github.com/mobichamp1/ClawTeam](https://github.com/mobichamp1/ClawTeam)

