# gno migration plan v26.11.16

Standing: UNVERIFIED

## Identity
- Path: /Users/sac/gno
- Remote: https://github.com/seanchatmangpt/gno.git (fork of rdf-elixir/gno)
- Branch: test/increase-chicago-coverage@54e42b1, upstream origin/test/increase-chicago-coverage
- Last commit: 2026-08-26; commits: 86; size: 1 MB
- Languages/build: Elixir (mix.exs, mix.lock), Makefile, Procfile.{oxigraph,qlever}.{dev,test}
- Nested repos: none

## Observed state
- dirty=0, untracked=6: docs/jira/v26.9.19/* survey and branch tickets,
  docs/jira/v26.11.12/TODO-FIX-AND-FINISH.md
- ahead=0 behind=0; stash=0; all 4 local branches track origin
- Build dirs: none (_build/deps absent); tmp/ present (small)
- Submodules: none; no secrets found

## What it is
Gno: Elixir library abstracting RDF dataset persistence across SPARQL triple stores (Oxigraph,
QLever, ...) with a unified query/update API, using DCAT-R for its model. Sean's fork carries
test-coverage and CI branches.

## Classification
WARM (census agrees).

## Migration risk
- Only the 6 untracked jira docs are unsaved. Everything else is pushed.
Rate: LOW

## Recommended action
COMMIT-PUSH
1. `cd /Users/sac/gno && git add docs/jira && git commit -m "docs(jira): survey + TODO"`
2. `git push origin test/increase-chicago-coverage`
3. CLONE-FRESH on the new machine; do not rsync.

## First commands on the new machine
`git clone https://github.com/seanchatmangpt/gno.git && cd gno && mix deps.get && mix test`
(needs an Oxigraph or QLever endpoint per Procfile; stated, not run).

## See Also
- ../v26.11.12/
- /Users/sac/docs/jira/v26.11.16/README.md
