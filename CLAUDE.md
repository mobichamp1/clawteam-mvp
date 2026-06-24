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
