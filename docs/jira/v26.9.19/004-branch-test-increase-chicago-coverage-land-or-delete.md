# gno: land or delete remote branch `test/increase-chicago-coverage`

- Standing: OPEN
- Created: 2026-09-19 (v26.9.19 gh survey wave)
- Source: remote branch `test/increase-chicago-coverage` — not merged into `main`, no open PR
- Evidence: `git branch -r --no-merged origin/main` lists it; absent from `gh pr list` heads

## Work to complete
- Decide: open a PR (`gh pr create -R seanchatmangpt/gno --head test/increase-chicago-coverage`) or delete (`git push origin --delete test/increase-chicago-coverage`).
- If superseded, delete; otherwise land through review.

## Acceptance
- After `git fetch --prune`, `git branch -r --no-merged origin/main` no longer lists `test/increase-chicago-coverage`.

## History
- 2026-09-19 | OPEN | survey found PR-less unmerged branch | test/increase-chicago-coverage | decision pending
