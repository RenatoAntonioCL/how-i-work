# Stack

My tools, my gaps, and where I'm going.

---

## Direction

I'm building toward owning projects end-to-end — design, implementation, deploy, scale, maintain. The goal isn't to specialize in one layer. It's to be capable across all of them.

**Profile:** Technical Founder — one engineer, full stack, full ownership.

**Agentic direction:** The industry is moving toward engineers who operate fleets of agents, not keyboards. The scarce skill is no longer writing code — it's defining intent, designing guardrails, and judging agent output. OrchFlow is being built with this in mind.

**Token cost awareness:** Agentic systems multiply token usage 5–50x per task. Prompt caching, hybrid routing, and local model fallback (Ollama) are not optional optimizations — they're the difference between a sustainable system and an unrunnable one. Caching + hybrid routing cuts spend 40-70% in production.

---

## What I use today

### Languages

| Language | Level | Used in |
|----------|-------|---------|
| **Bash** | Solid | GenPy (core), CI/CD scripts, automation |
| **Python** | Solid | CitySim (core), LLM RAG blueprint, scripting |
| **TypeScript** | Intermediate | OrchFlow (core), NestJS blueprint |
| **Go** | Basic | Go+Gin blueprint |

### Infrastructure & DevOps

| Tool | Level | Notes |
|------|-------|-------|
| **Docker** | Solid | Every project runs in a container. Non-negotiable. |
| **Docker Compose** | Solid | Local multi-service stacks. |
| **GitHub Actions** | Solid | CI/CD on every repo. Green CI = done. |
| **Traefik** | Familiar | Reverse proxy. Not yet applied to own systems. |
| **Prometheus + Grafana** | Familiar | Metrics and dashboards. Not yet applied to own systems. |

### AI / Agents

| Tool | Notes |
|------|-------|
| **Anthropic Claude API** | Primary LLM. Prompt caching in OrchFlow. |
| **Claude Code** | Daily development tool. Levels 1–5. |
| **Ollama** | Local model inference — powers `genpy review`. |

---

## Known gaps

| Gap | Why it matters | Priority |
|-----|----------------|----------|
| **SQL (PostgreSQL)** | Every backend role, every data layer. | High |
| **Cloud (AWS)** | Can't own a product end-to-end without knowing where it lives. | High |
| **API design** | OrchFlow needs a public interface. Contracts, versioning, OpenAPI. | Medium |
| **Security in CI** | Shift-left: trivy, gitleaks, dependency audits. | Medium |
| **Observability in practice** | I have the Prometheus blueprint. Not yet applied to own projects. | Medium |

---

## Non-negotiables on every project

- `Dockerfile` or `docker-compose.yml`
- CI pipeline (`.github/workflows/`) — green before merge
- Branch protection — no direct pushes to `main`
- `CONTEXT.md`, `ARCHITECTURE.md`, `CHANGELOG.md`
- Tests — language-native
- Semantic versioning
- ADRs for significant decisions
- PR template

---

## Where this goes

**Technical Founder** — build, ship, and scale independently, then grow a team around something that already works.

One step at a time.
