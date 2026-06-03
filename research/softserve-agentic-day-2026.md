# SoftServe R&D Agentic Day 2026
**Santiago, Chile**  
**Source:** First-hand attendance + audio transcription

---

## Speakers

| Speaker | Role | Topic |
|---------|------|-------|
| Marta | Functional Coordinator, R&D | Intro & company overview |
| Volodymyr (VP of R&D) | VP, R&D | R&D overview, agentic engineering direction |
| Arkadiusz Drohomirecki | Cluster Lead, Agentic Engineering | Agentic Shift: AI tools transforming software development |
| Taras Rumezhak | Associate R&D Director | Context Engineering and Observability: The Missing Layer of AI Platforms |
| Vodan Pomic | Associate Director, R&D | Physical AI, digital twins, hardware acceleration |

---

## Key insight 1 — The agentic engineering maturity model

SoftServe defines five maturity levels for organizations adopting AI in their engineering process:

1. **Code Assistant** — basic completion, single-file, IDE plugins
2. **Guided Development** — multi-file understanding, chat interface, intelligent debugging
3. **Delegated Engineering** — developer supervises outcomes, end-to-end feature development, autonomous testing
4. **Coordinated Engineering** — multiple specialized agents collaborate across SDLC, autonomous in defined domains
5. **Software Factory** — self-organizing teams, agents manage entire product lifecycle, humans set governance

Most organizations are currently at level 2-3. Level 4 is emerging. Level 5 is active research.

**Connection to my work:** OrchFlow targets level 4 — coordinated multi-agent systems. The "brief in, project out" vision maps directly to what SoftServe calls the Software Factory.

---

## Key insight 2 — The engineer role is changing

From Arkadiusz's talk and Q&A:

**What engineers stop doing:**
- Writing implementation manually
- Hunting context across repos
- Executing repetitive boilerplate
- Reviewing syntax and diffs
- Running tests after coding
- Operating a single feature

**What engineers start doing:**
- Specifying intent and constraints
- Curating context and guardrails
- Delegating bounded, parallel work
- Validating architecture, risk, outcomes
- Designing continuous verification
- Operating a fleet of agents

**The scarce skill is no longer typing code — it's defining intent, designing guardrails, and judging agent output.**

When asked what skills he prioritizes in candidates:
1. Curiosity — people who want to dive deeper, not just be assigned tasks
2. Flexibility — not afraid to cross domains (frontend/backend/infra)
3. Communication — if you can explain it to a human, you can explain it to an agent

**Connection to my work:** This is the exact profile I'm building. Generalists who own the entire pipeline benefit most from agentic tooling.

---

## Key insight 3 — Context engineering is an architectural discipline

From Taras Rumezhak's talk:

**Prompt engineering** = crafting a single instruction well.  
**Context engineering** = the systems-level discipline of deciding what knowledge reaches a model, in what form, at what moment, and with what priority.

Context must be treated as a **scarce resource**, not an unlimited input buffer. More context ≠ better results. It means more competition for the model's finite attention.

**Four reasons context engineering matters:**
1. Context rot is real — as token count grows, recall accuracy decreases
2. Attention is a finite budget — every token added reduces precision
3. Bigger windows won't fix this — the tension between size and focus persists regardless of window size
4. The engineering goal — find the smallest set of high-signal tokens that maximize the likelihood of the desired outcome at every step

**Production context management techniques:**
- **Compaction** — summarize conversation history approaching context limit, discard redundant tool outputs
- **Caching** — store frequently accessed context fragments to reduce latency and token spend
- **Artifact-backed context** — persist structured state as external files loaded on demand
- **Scoped instruction loading** — dynamically load only instructions relevant to the current task phase
- **Tool result clearing** — remove raw tool outputs once their information has been consumed and summarized

**Case study result:** A task management platform (3M+ monthly users) went from 42% to 91% accuracy after implementing proper context engineering and observability.

**Connection to my work:** OrchFlow needs context engineering from the design stage, not as a retrofit. The `CLAUDE.md` pattern in how-i-work is an application of this principle.

---

## Key insight 4 — AI observability is different from traditional observability

From Taras's talk:

Traditional observability asks: *"Is the system running?"*  
AI observability asks: *"Is the system doing the right thing?"*

A system can have:
- Healthy infrastructure (low latency, no errors) ✓
- Completed workflow (all steps "succeeded") ✓
- Bad outcomes (wrong, unsafe, low-quality) ✗

**In AI systems, "it ran" does not mean "it was right."**

**What to monitor in AI systems:**

| Layer | What to observe | What can go wrong |
|-------|----------------|-------------------|
| User input | Prompt structure, injection attempts | Input designed to confuse or redirect |
| Prompt | Token size, templates, versions | Inappropriate or imprecise context |
| Retrieval/tools | Relevance, success, coverage | Incomplete or irrelevant results |
| LLM | Latency, tokens, cost, variability | Hallucinations, suboptimal costs |
| Response | Quality, safety, format | Unsafe or incorrect output |
| Actions | Task success, retries, errors | Agent loops, uncontrolled sequences |
| Feedback | Human ratings, usage signals | Failure to improve from feedback |

**The most common failure point:** selection of the wrong tool or combination of tools. Every agent must have a precise description of its area of expertise.

**Connection to my work:** Observability in OrchFlow and CitySim cannot be added later. It must be designed in from the start — at every stage of the pipeline.

---

## Key insight 5 — Physical AI and digital twins (Vodan Pomic)

Less directly relevant to my current work, but important horizon:

- SoftServe is NVIDIA Partner of the Year globally
- They were the first company to implement Omniverse in production
- Digital twins reduce manufacturing facility design time by up to 95% (Krones case study)
- Inference market expected to grow 100x by end of 2027
- Inference will surpass training compute next year
- The future: hybrid on-device + cloud workflows, not pure cloud

**Connection to my work:** CitySim is conceptually a digital twin — persistent state, agent behavior, emergent phenomena. The same paradigm, different domain and scale.

---

## Key insight 6 — Security in agentic systems (from ICML 2026 paper)

SoftServe R&D in collaboration with University of Oxford published a paper accepted at ICML 2026:

**"It's a TRAP! Task-Redirecting Agent Persuasion Benchmark for Web Agents"**

Key findings:
- Web agents are redirected by adversarial content in **25% of tasks on average**
- Different models are more susceptible to different social engineering techniques
- DeepSeek was more easily controlled by authoritative requests
- Interface design and contextual wording strongly impact agent safety

**Implication:** Prompt injection is not a theoretical risk. For OrchFlow — which will read external content, interact with APIs, and execute code — adversarial robustness must be designed in from the start.

---

## Numbers worth remembering

- 51% of teams already using agentic AI (MIT Technology Review + SoftServe report)
- 45% plan to adopt within 12 months
- 84% expect it to be a top SE investment within 3 years
- 42% of code written today is AI-generated or AI-assisted
- 20M+ GitHub Copilot users (not counting Cursor, Claude Code, etc.)
- 60%+ predicted share of AI-generated code by 2027
- Claude Opus 4.6: 75.6% on SWE-bench Verified
- Context window: 4K tokens (2020) → 200K (2023) → 1M+ (2026)
- Caching + hybrid routing cuts token spend 40-70% in production

---

## Personal note

Demonstrated GenPy to Arkadiusz Drohomirecki after his talk. Conversation was technical — he asked specifically about how secrets are handled, the architecture of blueprints, and the integration with local models (Ollama). He connected on LinkedIn.

Also connected with Taras Rumezhak after his context engineering talk.

This was the first time SoftServe R&D visited Latin America.
