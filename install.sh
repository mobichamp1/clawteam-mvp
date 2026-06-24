#!/bin/bash
# ClawTeam MVP Install Script
set -e

echo "Installing ClawTeam..."
pip install clawteam

echo ""
echo "✅ ClawTeam installed!"
echo ""
echo "Next steps:"
echo "  1. Open the landing page: open website/index.html"
echo "  2. Run a demo: bash demo/hedge-fund-demo.sh"
echo ""
echo "Requirements: Python 3.10+, tmux, a CLI agent (claude, codex, openclaw...)"
