# Architecture

## Overview

how-i-work is a docs-only repo — no build, no runtime, no tests. Its structure is the architecture.
Every file is either a standard to follow, a template to copy, or a record of learning.

## Structure

```
how-i-work/
├── PROFILE.md              # Background, motivations, hard limits
├── PRINCIPLES.md           # Rules applied to every system I build
├── STACK.md                # Current tools, known gaps, direction
├── CONTEXT.md              # Current state of this repo
├── ARCHITECTURE.md         # This file
├── CHANGELOG.md            # Notable changes over time
├── apply-methodology.sh    # Applies standards to any existing repo
│
├── conventions/
│   ├── GIT.md              # Branching, PRs, commit format
│   ├── DOCS.md             # Required files in every repo
│   └── CI_CD.md            # Pipeline requirements and gates
│
├── templates/
│   ├── CLAUDE.md           # Base Claude Code context (per project)
│   ├── CLAUDE_GLOBAL.md    # Source for ~/.claude/CLAUDE.md
│   ├── CONTEXT.md          # Project context template
│   ├── ARCHITECTURE.md     # Architecture doc template
│   ├── ADR.md              # Architecture decision record template
│   ├── POSTMORTEM.md       # Post-mortem template
│   └── PULL_REQUEST.md     # PR description template
│
├── research/
│   └── *.md                # Notes from events and reading
│
└── .github/
    ├── pull_request_template.md
    └── workflows/
        ├── audit.yml               # Compliance checker (deployed to target repos)
        └── update-propagator.yml   # Propagates standard changes to target repos
```

## Key decisions

No ADRs yet — no decisions complex enough to warrant one.

## Propagation model

```
how-i-work (this repo)
    └── update-propagator.yml
          ├── on push to main (templates/ or conventions/ changed)
          └── opens PR in each target repo:
                GenPy · OrchFlow · simulacion-urbana · qrfila
                    └── .github/workflows/audit.yml   ← deployed here
                    └── .github/pull_request_template.md
                    └── .github/how-i-work-sync.json
```

The audit workflow runs inside each target repo and checks that repo's compliance.
