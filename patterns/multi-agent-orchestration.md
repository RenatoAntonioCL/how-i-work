# Multi-Agent Orchestration in Claude Code

How Claude Code acts as an orchestrator that launches parallel subagents, and what does and does not cross the boundary between them.

Discovered empirically on 2026-07-01 during a multi-repo, read-only diagnosis session.

---

## What the pattern is

Claude Code, given a prompt with clearly delimited tasks and an instruction to "run in parallel where possible", launches parallel subagents natively. Each subagent runs its task in its own context and returns a result to the orchestrator, which synthesizes. No framework or special setup is required — the orchestration is a native capability triggered by prompt shape.

---

## How context propagates to subagents

A subagent sees **two sources of context only**:

1. **What the orchestrator explicitly passes** in the subprompt.
2. **The `CLAUDE.md`** of the repository the subagent is working in.

Subagents do **not** inherit the orchestrator's conversation history. Anything established only in chat — earlier decisions, clarifications, constraints stated to the orchestrator — is invisible to them.

---

## CLAUDE.md as the specialization / memory layer

Because history does not propagate, any domain knowledge, convention, or constraint that must survive across agents has to live in one of the two channels above:

- **Repo-level `CLAUDE.md`** — durable, applies to every agent working in that repo. This is how you build specialized workers: the repo's `CLAUDE.md` is its persistent brief.
- **The subprompt** — per-invocation, applies only to that agent.

If it is not in one of these, it does not exist for the agent.

---

## Key failure mode

Session constraints placed only in the orchestrator's chat history are silently dropped at the subagent boundary. Examples: "read-only", "no commits", "no GitHub writes", "diagnose before touching".

The orchestrator will honor them; a subagent it launches will not, because it never saw them. Constraints that must hold across agents belong in `CLAUDE.md` or in every subprompt, explicitly. A safety rule stated once in chat is not a safety rule for the fleet.

---

## Triggering parallel agents

A prompt with clearly labeled tasks (`TASK 1` / `TASK 2` / `TASK N`) plus the line "run in parallel where possible" is sufficient. No configuration, flags, or tooling needed. The clarity of the delimitation is what lets the orchestrator fan out safely.

---

## When to orchestrate vs. run sequentially

| Mode | Use for |
|------|---------|
| **Parallel / orchestrated** | Diagnosis, read-only investigation, independent scopes with no shared state. |
| **Sequential with explicit gates** | Any work that touches code, commits, or external systems — gate between each step. |

The dividing line is shared state and side effects. Independent reads fan out; anything that writes runs in order, with a decision gate between steps.
