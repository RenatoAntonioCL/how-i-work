# Project Context for Claude Code

## Project
how-i-work — my public engineering methodology. This is **not a software project, it's a
living document**: identity, principles, stack, conventions, and the templates I reuse.

## How to help here
The goal is always to keep this **honest, precise, and up to date with what I actually do —
not aspirational**. When editing:
- Describe reality, not intentions. If something isn't true yet, don't write it as if it is.
- Prefer cutting vague or aspirational claims over adding more of them.
- Keep it tight and concrete. This is read by people deciding how I work.
- Keep the docs internally consistent (README ↔ conventions ↔ templates ↔ global context).

## Owner
Renato Antonio — https://github.com/RenatoAntonioCL/how-i-work

## Stack
Markdown only. No build, no runtime, no tests — content quality is the only thing that matters.

## Structure
- Root: `README.md`, `PROFILE.md`, `PRINCIPLES.md`, `STACK.md` — identity and standards.
- `conventions/` — `GIT.md`, `DOCS.md`, `CI_CD.md`. Rules applied to every repo I own.
- `templates/` — base files copied into new projects (`CLAUDE.md`, `CONTEXT.md`,
  `ARCHITECTURE.md`, `ADR.md`, `POSTMORTEM.md`, `PULL_REQUEST.md`) plus
  `CLAUDE_GLOBAL.md`, the source for `~/.claude/CLAUDE.md`.
- `research/` — notes from events and reading, with connections to my work.
- `.github/pull_request_template.md` — active PR template for this repo.

## Non-negotiables
- **Every change goes through a PR — no direct pushes to `main`, ever.**
- Branch from `main`, open a PR, merge after review (self-review when working alone).
- No secrets in code — use environment variables.
- No placeholders left in real docs (templates carry them; shipped docs must not).

## Conventions
- Commit format: type(scope): description (Conventional Commits)
- Branch format: feat/description, fix/description, docs/description, chore/description
- PR template: .github/pull_request_template.md
- Commits NEVER include `Co-Authored-By` lines (no Claude/AI co-author) — ever
- Conversation in neutral Spanish; documents stay in English to match existing files

## What to avoid
- Aspirational or vague claims about how I work
- Drift between `templates/CLAUDE_GLOBAL.md` and the installed `~/.claude/CLAUDE.md`
- Duplicating files across directories (one canonical location per document)
