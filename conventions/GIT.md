# Git Conventions

These rules apply to every repo I own. No exceptions.

---

## Branch strategy

| Branch | Purpose | Rules |
|--------|---------|-------|
| `main` | Production-ready code | Protected. Never push directly. |
| `feat/description` | New features | Branch from main, PR back to main. |
| `fix/description` | Bug fixes | Branch from main, PR back to main. |
| `docs/description` | Documentation only | Branch from main, PR back to main. |
| `chore/description` | Maintenance, deps, config | Branch from main, PR back to main. |

---

## Commit format

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
type(scope): short description

Optional body explaining why, not what.
```

**Types:** `feat` · `fix` · `docs` · `chore` · `refactor` · `test` · `ci`

**Examples:**
```
feat(auth): add JWT token validation
fix(cli): handle missing config file gracefully
docs(readme): update installation steps
chore(deps): upgrade to Node 20
```

---

## Pull requests

- Every change to `main` goes through a PR — no exceptions
- PR must have a description explaining what and why
- CI must be green before merge
- At least one review before merge (self-review when working alone)
- Use the PR template (`.github/pull_request_template.md`)
- Squash merge to keep main history clean

---

## Branch protection rules (apply to every repo)

In GitHub Settings → Branches → Add rule for `main`:
- ✅ Require a pull request before merging
- ✅ Require status checks to pass
- ✅ Do not allow bypassing the above settings

---

## Versioning

Semantic versioning: `MAJOR.MINOR.PATCH`

- `PATCH` — bug fixes, no API change
- `MINOR` — new features, backward compatible
- `MAJOR` — breaking changes

Tag every release: `git tag v1.2.3`

---

## What not to do

- Never push directly to `main`
- Never force push to shared branches
- Never commit secrets, credentials, or `.env` files
- Never commit with message "fix", "update", "changes", or "wip" alone
- Never merge without green CI
