# Master Plan

<!-- The MASTER_PLAN is the seed document of every project — created before writing code.
     It's the executive summary of everything else: context, architecture, decisions,
     roadmap, and current state, all in one place.

     Replace all [placeholders] with real content. Remove these comments when done.
     Keep each section tight — link to full docs instead of duplicating them. -->

## Vision

<!-- One sentence: what problem this project solves and why it exists. -->

[Project name] [does what] for [who], because [why it matters].

<!-- Example: GenPy generates Docker-ready Python projects from the CLI,
     because scaffolding the same boilerplate by hand wastes time and invites mistakes. -->

## Status

| Field        | Value                |
|--------------|----------------------|
| Phase        | [Phase 0 / Alpha / Beta / Stable] |
| Version      | [v0.0.1]             |
| Last updated | [YYYY-MM-DD]         |

## Context

<!-- Summary of CONTEXT.md — who uses it, what it does, what it does NOT do. -->

- **Users**: [target users or systems]
- **Does**: [core capabilities, 2-3 bullets max]
- **Does not**: [explicit non-goals]

## Architecture

<!-- Summary of ARCHITECTURE.md — stack, patterns, key directories. -->

- **Stack**: [languages, frameworks, infra]
- **Patterns**: [e.g., Hexagonal, DDD, SOLID — only what's actually applied]
- **Structure**:
  ```
  src/
    [key directories with one-line purpose]
  ```

## Key Decisions

<!-- Most important ADRs, one line each. Link to the full ADR. -->

| # | Decision | Status | Link |
|---|----------|--------|------|
| 1 | [Decision title] | [Accepted / Superseded] | [docs/adr/001-decision.md] |

<!-- Example:
| 1 | Use SQLite over Postgres | Accepted | [docs/adr/001-sqlite.md] |
| 2 | Hexagonal architecture   | Accepted | [docs/adr/002-hexagonal.md] | -->

## Roadmap

<!-- Project phases with status. Keep it honest — planned means not started. -->

| Phase | Description | Status |
|-------|-------------|--------|
| 0     | [Foundation — core structure, CI, docs] | [done / in progress / planned] |
| 1     | [First deliverable] | [planned] |

## Current Sprint

<!-- What is being worked on right now. Remove completed items, don't accumulate history. -->

- [ ] [Current task 1]
- [ ] [Current task 2]

## Known Issues

<!-- Active bugs or technical debt. Not a backlog — only things that affect current work. -->

- [Issue description] — [impact or workaround if any]

## Links

| Document | Path |
|----------|------|
| Context        | [CONTEXT.md](../CONTEXT.md) |
| Architecture   | [ARCHITECTURE.md](../ARCHITECTURE.md) |
| ADRs           | [docs/adr/](../docs/adr/) |
| Changelog      | [CHANGELOG.md](../CHANGELOG.md) |
