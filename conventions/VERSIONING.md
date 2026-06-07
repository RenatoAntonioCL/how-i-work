# Versioning

Two independent version tracks exist in this ecosystem.

---

## 1. Standards version (this repo)

Stored in `VERSION` at the root of how-i-work. Format: `MAJOR.MINOR.PATCH`.

| Increment | When |
|-----------|------|
| `PATCH` | Clarification, wording fix, tooling correction — no convention change |
| `MINOR` | New convention, new required file, new template, new check in `audit.yml` |
| `MAJOR` | Breaking change — something target repos must actively change to stay compliant |

**Version bump checklist:**
1. Update `VERSION`
2. Update `CHANGELOG.md` — move `[Unreleased]` to `[x.y.z] - YYYY-MM-DD`
3. If `templates/CONTEXT.md` or any propagated file changed, commit everything together
4. Merge the PR → `update-propagator.yml` fires automatically and opens PRs in all target repos

---

## 2. Project version (target repos)

Each repo (GenPy, OrchFlow, society-sim, qrfila) maintains its own independent semver:
- Tracked in its own `VERSION` file or Git tag — whatever suits that project's release model
- Has no coupling to the standards version

---

## HOW_I_WORK_VERSION in CONTEXT.md

Every target repo's `CONTEXT.md` must contain this field:

```
HOW_I_WORK_VERSION: 0.3.0
```

**What it means:** the repo's documentation and tooling are aligned to that version of the standards.
It does not mean the project's code follows any particular version — only the process does.

**How it gets there:** `update-propagator.yml` sets or updates this field automatically every time a
standards change is propagated. It uses `sed` to replace an existing line, or `awk` to insert it
after the `# Context` heading if the field is missing.

**When to update it manually:** only if you manually apply a standards update without going through
the propagator (e.g., `apply-methodology.sh`). In that case, set `HOW_I_WORK_VERSION` to the value
in how-i-work's `VERSION` file at the time of the update.

---

## What a propagator PR means for a target repo

When you receive a `chore: sync how-i-work standards vX.Y.Z` PR:

1. Review the diff — check if any propagated file needs project-specific adjustment
2. If it's a `MINOR` or `MAJOR` bump, read `CHANGELOG.md` in how-i-work for context
3. Merge when CI is green — do not close without merging unless the change is incompatible
4. For `MAJOR` bumps, open a follow-up issue or PR to address breaking changes in the project

---

## What not to do

- Never edit `HOW_I_WORK_VERSION` manually to a version that doesn't exist in how-i-work
- Never bump the standards version without updating `CHANGELOG.md`
- Never use a project's semver to communicate standards alignment — that's what `HOW_I_WORK_VERSION` is for
