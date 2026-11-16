# gno: land or delete remote branch `fix/stale-gno-app-namespace-in-docs`

- Standing: OPEN
- Created: 2026-09-19 (v26.9.19 gh survey wave)
- Source: remote branch `fix/stale-gno-app-namespace-in-docs` — not merged into `main`, no open PR
- Evidence: `git branch -r --no-merged origin/main` lists it; absent from `gh pr list` heads

## Work to complete
- Decide: open a PR (`gh pr create -R seanchatmangpt/gno --head fix/stale-gno-app-namespace-in-docs`) or delete (`git push origin --delete fix/stale-gno-app-namespace-in-docs`).
- If superseded, delete; otherwise land through review.

## Acceptance
- After `git fetch --prune`, `git branch -r --no-merged origin/main` no longer lists `fix/stale-gno-app-namespace-in-docs`.

## History
- 2026-09-19 | OPEN | survey found PR-less unmerged branch | fix/stale-gno-app-namespace-in-docs | decision pending
