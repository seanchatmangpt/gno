# TODO-FIX-AND-FINISH (gno)

Standing: UNVERIFIED

Source: `ash_surface/docs/jira/v26.11.11/PROJECT-REVIEWS.md` R10, re-read where marked confirmed.

## Fix

- HIGH `lib/mix/tasks/gno/setup.ex:22,47-48` option parsed as `:string`, passed to
  `store_adapters/fuseki.ex:375-380` which matches atoms and raises on others (confirmed).
  Check: `mix gno.setup --on-existing-dataset ignore` succeeds.
- MED `commit_middlewares/logger.ex:153` `String.to_existing_atom` on free level (confirmed).
  Check: unknown level yields typed error, commit not aborted.
- MED `service/setup.ex:78-87` create-before-check, no cleanup UNVERIFIED (not re-read).
- MED `mix gno.teardown` no confirmation (`fuseki.ex:392-405`) UNVERIFIED.
- LOW `utils_test.exs:26-30` env dependence and stale `gno.app` docs UNVERIFIED.

## Finish

- Convert string option to atom with whitelist. Check: test for each strategy.
- Add `--yes` gate to teardown. Check: teardown without flag refuses.

## Commit hygiene

- `docs/` untracked (confirmed `??`). Check: tracked.

## Decide

- Should teardown be removed from default mix aliases?

## Reuse

- None cited.

## See Also

- `ash_surface/docs/jira/v26.11.11/PROJECT-REVIEWS.md` R10
