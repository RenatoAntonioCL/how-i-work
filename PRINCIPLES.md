# Principles

These are the rules I apply to every system I build. Not aspirational — operational.

---

## 1. Foundations first

Features are temporary. Architecture is permanent. Before adding anything new, I ask: does the base support this? If not, the base gets fixed first.

## 2. If it can't be observed, it doesn't exist

Every system must be auditable. Logs tell you what happened. Metrics tell you how the system is performing. Traces tell you why. All three are required.

For AI systems, traditional observability is not enough. Infrastructure can be healthy, a workflow can complete, and the outcome can still be wrong. AI observability requires additional signals: output quality, semantic correctness, hallucination detection, token cost, and safety. "It ran" is not the same as "it was right."

## 3. Determinism over magic

Given the same inputs, a system must produce the same outputs. Every time. Non-deterministic behavior is technical debt. I eliminate it.

## 4. Layers, not monoliths

Complex systems are built in separable layers, each with a clear contract. Each layer can be understood, tested, and replaced independently. Changing one layer must not require touching the others.

## 5. Scalability is a design decision, not a retrofit

Scalability cannot be added afterward. The architecture must either support it from the start, or at minimum not prevent it.

## 6. Security is not a feature — it's a foundation

Security belongs in the design, not the backlog. Secrets never in code. Dependencies scanned in CI. Principle of least privilege everywhere. HTTPS by default. Threat modeling before building, not after a breach.

## 7. Tests as contracts

Tests aren't a quality checkbox. They define what the system promises to do. A failing test isn't a bug report — it's a broken contract.

## 8. Documentation is part of the work

A feature without documentation is half-finished. I document decisions (why, not just what), architecture (structure and contracts), and context (current state and what's next).

## 9. Own it end-to-end

I'm responsible for the system from design to production to incident. I know where it runs, how it fails, and what to do when it does.

## 10. One mistake is learning. Two is a system problem.

I fix root causes, not symptoms. If something breaks twice for the same reason, the process is wrong — not just the code. The answer is a post-mortem and a convention, not a hotfix.

## 11. Do more with less time

The goal is not to work more hours. It's to build systems resilient enough that they run without constant intervention. Automation, good defaults, and solid architecture are how you buy time back.

## 12. Context is a scarce resource

In AI systems, more context does not mean better results. It means more competition for the model's finite attention. Context must be engineered — deciding what knowledge reaches a model, in what form, at what moment, and with what priority.

This is an architectural concern, not a prompting trick. Raw context accumulation is a failure mode. The goal is the smallest set of high-signal tokens that maximizes the likelihood of the desired outcome at every step.

## 13. Humans stay in the loop

Agents and orchestrators should never have full authority. There must always be a human checkpoint on key decisions — budget, irreversible actions, calling new external tools. We minimize human intervention but never eliminate it.
