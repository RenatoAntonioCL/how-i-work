# Context

HOW_I_WORK_VERSION: 0.3.0

## Current state

The core methodology is documented and stable:
- Identity docs: `PROFILE.md`, `PRINCIPLES.md`, `STACK.md`
- Conventions: `GIT.md`, `DOCS.md`, `CI_CD.md`
- Templates: CLAUDE.md, CONTEXT.md, ARCHITECTURE.md, ADR.md, POSTMORTEM.md, PULL_REQUEST.md
- Tooling: `apply-methodology.sh` applies standards to any existing repo
- CI: `audit.yml` checks compliance; `update-propagator.yml` propagates changes to target repos

## In progress

- Configuring `GH_PAT` secret to activate the update propagator
- Initial audit of target repos (GenPy, OrchFlow, simulacion-urbana, qrfila) against the compliance checker

## Known issues

- qrfila is missing from the README ecosystem table
- No ADRs written yet — no decisions complex enough to warrant one so far
- Target repos have not been audited; compliance status is unknown

## Working conventions

- All changes via PR — no direct pushes to main
- Conventional Commits: `type(scope): description`
- Branches: `feat/`, `fix/`, `docs/`, `chore/`
- No `Co-Authored-By` lines in any commit, ever
- Docs stay in English; conversation in neutral Spanish

## Next steps

1. Add `GH_PAT` secret to activate `update-propagator.yml`
2. Run `audit.yml` manually on each target repo to assess compliance
3. Add qrfila to the README ecosystem table
