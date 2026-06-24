#!/bin/bash
# ClawTeam Software Dev Team Demo
# Launches a 4-agent development team: architect + backend + frontend + tester
set -e

TEAM_NAME="${1:-demo-dev}"

echo "=== ClawTeam Software Dev Team Demo ==="
echo "Team: $TEAM_NAME"
echo ""

if ! command -v tmux &> /dev/null; then
    echo "ERROR: tmux not found. Install with: brew install tmux"
    exit 1
fi

if ! command -v clawteam &> /dev/null; then
    echo "ERROR: clawteam not installed. Run: pip install clawteam"
    exit 1
fi

clawteam team spawn-team "$TEAM_NAME" -d "Build a REST API with auth" -n leader

clawteam task create "$TEAM_NAME" "Design REST API schema" -o architect
clawteam task create "$TEAM_NAME" "Implement JWT auth" -o backend --blocked-by "$(clawteam task list "$TEAM_NAME" --owner architect --json 2>/dev/null | python3 -c 'import sys,json; t=[x for x in json.load(sys.stdin)[\"tasks\"] if x[\"owner\"]==\"architect\"]; print(t[0][\"id\"] if t else \"\")' 2>/dev/null || echo '')"
clawteam task create "$TEAM_NAME" "Build React frontend" -o frontend
clawteam task create "$TEAM_NAME" "Integration tests" -o tester

echo ""
echo "✅ Team '$TEAM_NAME' created with 4 tasks!"
echo ""
echo "Spawn agents:"
echo "  clawteam spawn --team $TEAM_NAME --agent-name architect   --task 'Check your tasks: clawteam task list $TEAM_NAME --owner architect'"
echo "  clawteam spawn --team $TEAM_NAME --agent-name backend     --task 'Check your tasks: clawteam task list $TEAM_NAME --owner backend'"
echo "  clawteam spawn --team $TEAM_NAME --agent-name frontend    --task 'Check your tasks: clawteam task list $TEAM_NAME --owner frontend'"
echo "  clawteam spawn --team $TEAM_NAME --agent-name tester      --task 'Check your tasks: clawteam task list $TEAM_NAME --owner tester'"
echo ""
echo "Watch:"
echo "  clawteam board attach $TEAM_NAME"
