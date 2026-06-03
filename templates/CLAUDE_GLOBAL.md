# Renato Antonio — Global Context

## Who I am
Self-taught developer based in Santiago, Chile.
Building toward Technical Founder — one engineer, full stack, full ownership.
Full methodology: https://github.com/RenatoAntonioCL/how-i-work

## Active projects
- **GenPy** — Bash CLI, Docker project generator, v1.0.0-alpha, stable
- **OrchFlow** — Agent engine, TypeScript + Claude API, Phase 0
- **simulacion-urbana** — Urban simulation, Python, v0.0.1

## Stack
Bash · Python · TypeScript · Go · Docker · GitHub Actions · Claude API · Ollama

## Non-negotiables on every project
- Branch protection on main — no direct pushes, ever
- CI must be green before merge
- Every PR uses the PR template (.github/pull_request_template.md)
- Required files: CONTEXT.md, ARCHITECTURE.md, CHANGELOG.md
- Semantic versioning
- ADRs for significant decisions
- No secrets in code — environment variables always

## Conventions
Full conventions: https://github.com/RenatoAntonioCL/how-i-work/tree/main/conventions

- Commits: Conventional Commits (feat/fix/docs/chore/refactor/test/ci)
- Branches: feat/ fix/ docs/ chore/
- Merges: squash merge only, green CI required

## Principles
Full principles: https://github.com/RenatoAntonioCL/how-i-work/blob/main/PRINCIPLES.md

1. Foundations first
2. If it can't be observed, it doesn't exist
3. Determinism over magic
4. Layers, not monoliths
5. Scalability is a design decision, not a retrofit
6. Security is not a feature — it's a foundation
7. Tests as contracts
8. Documentation is part of the work
9. Own it end-to-end
10. One mistake is learning. Two is a system problem.
11. Do more with less time
12. Context is a scarce resource
13. Humans stay in the loop

## When starting a new project
1. Copy templates from how-i-work/templates/
2. Set up branch protection on main
3. Create CI pipeline
4. Initialize CONTEXT.md, ARCHITECTURE.md, CHANGELOG.md
5. Create first ADR for the core architectural decision

## What I avoid
- Magic frameworks that abstract away what I need to understand
- Premature abstraction
- Dependency sprawl
- Placeholders in shipped code (changeme, TODO, fix later)
- Pushing directly to main

---

## Preferencias globales

### Commits
- NO agregar líneas de coautoría (`Co-Authored-By`) en los mensajes de commit. Nunca.

### Comunicación
- Escribir en **español neutro**, sin argentinismos ni voseo (usar "puedes", "tienes",
  "revisa", "mira"; evitar "podés", "tenés", "mirá", "dale", "acá", etc.).
- Aplica tanto a las respuestas como a documentos, código y mensajes de commit.
