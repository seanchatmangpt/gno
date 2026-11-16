# gno: land or delete remote branch `fix/pin-tool-versions`

- Standing: OPEN
- Created: 2026-09-19 (v26.9.19 gh survey wave)
- Source: remote branch `fix/pin-tool-versions` — not merged into `main`, no open PR
- Evidence: `git branch -r --no-merged origin/main` lists it; absent from `gh pr list` heads

## Work to complete
- Decide: open a PR (`gh pr create -R seanchatmangpt/gno --head fix/pin-tool-versions`) or delete (`git push origin --delete fix/pin-tool-versions`).
- If superseded, delete; otherwise land through review.

## Acceptance
- After `git fetch --prune`, `git branch -r --no-merged origin/main` no longer lists `fix/pin-tool-versions`.

## History
- 2026-09-19 | OPEN | survey found PR-less unmerged branch | fix/pin-tool-versions | decision pending
