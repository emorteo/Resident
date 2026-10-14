# Public Release Checklist

Before committing or pushing a public RESIDENT release:

1. Run the public smoke test.
2. Confirm no private data are staged.
3. Scan staged files for absolute local paths.
4. Scan staged files for tokens, passwords, private keys, and personal emails.
5. Confirm `resident_pipeline_is_standalone()` returns `TRUE`.
6. Confirm `resident_assert_active_implementations(FALSE, TRUE)$ok` returns `TRUE`.
7. Confirm `resident_tmb_file_sync_report()` reports synchronized TMB files.
8. Review `git diff --cached` before commit.

Private empirical catalogues and identifiers must remain outside the public repository.
