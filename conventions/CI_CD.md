# CI/CD Conventions

Every repo must have a working pipeline. Green CI is the only definition of "done".

---

## Pipeline requirements

Every repo must have `.github/workflows/ci.yml` that runs on every PR and push to main.

**Minimum pipeline steps:**
1. Lint
2. Test
3. Build (if applicable)
4. Security scan (trivy for containers, gitleaks for secrets)

---

## Pipeline structure

```yaml
name: CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  ci:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Lint
      - name: Test
      - name: Build
      - name: Security scan
```

---

## Gates

These must pass before any merge:
- All tests green
- No lint errors
- No secrets detected (gitleaks)
- Build succeeds

---

## Security scanning

```yaml
- name: Scan for secrets
  uses: gitleaks/gitleaks-action@v2

- name: Scan container
  uses: aquasecurity/trivy-action@master
  with:
    image-ref: your-image:latest
    severity: HIGH,CRITICAL
```

---

## Deployment

- Never deploy from local machine
- Deploy only from green main
- Every deployment is traceable to a commit

---

## What not to do

- Never skip CI to "fix it later"
- Never merge a red pipeline
- Never deploy manually what can be automated
