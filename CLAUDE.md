# Project Context for Claude Code

## Project
how-i-work — my engineering methodology: identity, principles, stack, conventions, and reusable templates.

## Owner
Renato Antonio — https://github.com/RenatoAntonioCL/how-i-work

## Stack
Markdown only. No build, no runtime — this is a documentation repository.

## Structure
- Root: `README.md`, `PROFILE.md`, `PRINCIPLES.md`, `STACK.md` — identity and standards.
- `conventions/` — `GIT.md`, `DOCS.md`, `CI_CD.md`. Rules applied to every repo I own.
- `templates/` — base files copied into new projects (`CLAUDE.md`, `CONTEXT.md`,
  `ARCHITECTURE.md`, `ADR.md`, `POSTMORTEM.md`, `PULL_REQUEST.md`) plus
  `CLAUDE_GLOBAL.md`, the source for `~/.claude/CLAUDE.md`.
- `research/` — notes from events and reading, with connections to my work.
- `.github/pull_request_template.md` — active PR template for this repo.

## Non-negotiables
- Branch protection on main — no direct pushes
- CI must be green before merge (when a pipeline applies)
- No secrets in code — use environment variables
- Every significant decision gets an ADR
- Semantic versioning

## Conventions
- Commit format: type(scope): description (Conventional Commits)
- Branch format: feat/description, fix/description, docs/description, chore/description
- PR template: .github/pull_request_template.md
- Commits NEVER include `Co-Authored-By` lines (no Claude/AI co-author) — ever
- Writing in neutral Spanish for conversation; documents in English to match existing files

## Current focus
Keeping this methodology coherent and in sync with the global context (`templates/CLAUDE_GLOBAL.md`)
and the active projects: GenPy, OrchFlow, simulacion-urbana.

## What to avoid
- Placeholders left in shipped files (the templates carry them; real docs must not)
- Drift between `templates/CLAUDE_GLOBAL.md` and the installed `~/.claude/CLAUDE.md`
- Duplicating files across directories (one canonical location per document)
