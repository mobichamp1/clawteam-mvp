#!/bin/bash
# ClawTeam AI Hedge Fund Demo
# Launches a 7-agent investment analysis team
set -e

TEAM_NAME="${1:-demo-fund}"
GOAL="${2:-Analyze AAPL, MSFT, NVDA for Q2 2026}"

echo "=== ClawTeam AI Hedge Fund Demo ==="
echo "Team: $TEAM_NAME"
echo "Goal: $GOAL"
echo ""

# Check prerequisites
if ! command -v tmux &> /dev/null; then
    echo "ERROR: tmux not found. Install with: brew install tmux"
    exit 1
fi

if ! command -v clawteam &> /dev/null; then
    echo "ERROR: clawteam not installed. Run: pip install clawteam"
    exit 1
fi

# Launch the hedge fund team from template
clawteam launch hedge-fund --team-name "$TEAM_NAME" --goal "$GOAL"

echo ""
echo "✅ Team launched! Watch with:"
echo "   clawteam board attach $TEAM_NAME"
echo ""
echo "Check status:"
echo "   clawteam board show $TEAM_NAME"
