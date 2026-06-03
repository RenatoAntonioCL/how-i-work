# Documentation Conventions

Every repo I own must have these files. No exceptions.

---

## Required files

| File | Purpose |
|------|---------|
| `README.md` | Entry point. What it is, how to run it, how to use it. |
| `CONTEXT.md` | Current state. What's working, what's in progress, known issues. |
| `ARCHITECTURE.md` | Structure, decisions, contracts between layers. |
| `CHANGELOG.md` | Version history. Every release documented. |
| `docs/adr/` | Architecture Decision Records. One file per significant decision. |

---

## README structure

```markdown
# Project Name

One-line description.

## What it does
## Quick start
## Requirements
## Usage
## Architecture (brief, link to ARCHITECTURE.md)
## Contributing
```

---

## CONTEXT.md structure

```markdown
# Context

## Current state
What is working right now.

## In progress
What is actively being built.

## Known issues
What is broken or incomplete.

## Working conventions
Specific rules for this repo (naming, structure, patterns).

## Next steps
Immediate priorities.
```

---

## ARCHITECTURE.md structure

```markdown
# Architecture

## Overview
High-level description of the system.

## Structure
Directory layout and what each part does.

## Key decisions
Link to ADRs for major decisions.

## Contracts
Interfaces between layers or services.

## Data flow
How data moves through the system.
```

---

## ADR format

File name: `docs/adr/NNNN-short-title.md`

```markdown
# ADR-NNNN: Title

**Date:** YYYY-MM-DD  
**Status:** Proposed | Accepted | Deprecated | Superseded by ADR-XXXX

## Context
What is the situation that requires a decision?

## Decision
What was decided?

## Consequences
What are the results of this decision — positive and negative?
```

---

## CHANGELOG format

Follow [Keep a Changelog](https://keepachangelog.com/):

```markdown
# Changelog

## [Unreleased]

## [1.0.0] - YYYY-MM-DD
### Added
### Changed
### Fixed
### Removed
```
