# GitHub Setup — Pending

## Status

MVP code is complete and ready. GitHub repo creation is blocked on credentials.

## What's Ready

- `website/index.html` — Landing page
- `demo/hedge-fund-demo.sh` — 7-agent demo
- `demo/dev-team-demo.sh` — 4-agent dev team demo
- `install.sh` — Installation script
- `.github/workflows/deploy.yml` — GitHub Pages CI/CD
- `.gitignore`, `README.md`, `CLAUDE.md`
- Local git history (3 commits)

## What Needs to Happen

Someone with GitHub access must run on this machine:

```bash
gh auth login
```

Or set `GITHUB_TOKEN` env var with `repo` scope, then the next agent can:
1. Create repo under ClawTeam org via `gh repo create`
2. Add remote: `git remote add origin https://github.com/ClawTeam/clawteam-mvp`
3. Push: `git push -u origin main`
4. Update landing page links to point to the new repo URL

## Expected Repo URL

`https://github.com/ClawTeam/clawteam-mvp`

## Blocker

No GitHub credentials exist in this environment (`gh auth status` = not logged in).
