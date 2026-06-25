#!/usr/bin/env bash
# ClawTeam fork installer — mobichamp1/ClawTeam
#
# Convenience wrapper that delegates to the upstream install scripts
# but redirects SKILLS_BASE to this fork so the ClawTeam skill
# is installed from mobichamp1/ClawTeam instead of HKUDS/ClawTeam.

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# Redirect skill downloads to our fork
export CLAWTEAM_SKILLS_BASE="${CLAWTEAM_SKILLS_BASE:-https://raw.githubusercontent.com/mobichamp1/ClawTeam/main/skills/clawteam}"

# Detect install mode: from git clone (local source) vs. from PyPI / git URL
if [ -f "${SCRIPT_DIR}/pyproject.toml" ] && [ -d "${SCRIPT_DIR}/skills/clawteam" ]; then
    # Local source checkout — use the local install script
    exec bash "${SCRIPT_DIR}/scripts/clawteam_local_install"
else
    # Remote / pip install — delegate to the upstream install script
    exec bash "${SCRIPT_DIR}/scripts/clawteam_install" "$@"
fi
