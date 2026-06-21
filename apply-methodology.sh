#!/usr/bin/env bash
# apply-methodology.sh
# Applies how-i-work standards to any existing GitHub repo
# Usage: ./apply-methodology.sh <repo-name>
# Example: ./apply-methodology.sh genpy

set -euo pipefail

REPO=$1
GITHUB_USER="RenatoAntonioCL"
HOW_I_WORK="$HOME/Developer/how-i-work"

if [[ -z "$REPO" ]]; then
  echo "Usage: $0 <repo-name>"
  exit 1
fi

REPO_PATH="$HOME/Developer/$REPO"

if [[ ! -d "$REPO_PATH" ]]; then
  echo "❌ Repo not found at $REPO_PATH"
  echo "   Clone it first: gh repo clone $GITHUB_USER/$REPO $REPO_PATH"
  exit 1
fi

echo "🏭 Applying how-i-work methodology to: $REPO"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

cd "$REPO_PATH"

# ── 1. PR Template ──────────────────────────────────────────────
echo "→ PR template..."
mkdir -p .github
if [[ ! -f ".github/pull_request_template.md" ]]; then
  cp "$HOW_I_WORK/templates/PULL_REQUEST.md" ".github/pull_request_template.md"
  echo "  ✅ Created .github/pull_request_template.md"
else
  echo "  ⏭  Already exists"
fi

# ── 2. CLAUDE.md ────────────────────────────────────────────────
echo "→ CLAUDE.md..."
if [[ ! -f "CLAUDE.md" ]]; then
  cp "$HOW_I_WORK/templates/CLAUDE.md" "CLAUDE.md"
  sed -i '' "s/\[Project name\]/$REPO/" CLAUDE.md 2>/dev/null || \
  sed -i "s/\[Project name\]/$REPO/" CLAUDE.md
  echo "  ✅ Created CLAUDE.md (fill in the details)"
else
  echo "  ⏭  Already exists"
fi

# ── 3. MASTER_PLAN.md ────────────────────────────────────────────
echo "→ MASTER_PLAN.md..."
if [[ ! -f "MASTER_PLAN.md" ]]; then
  cp "$HOW_I_WORK/templates/MASTER_PLAN.md" "MASTER_PLAN.md"
  sed -i '' "s/\[Project name\]/$REPO/" MASTER_PLAN.md 2>/dev/null || \
  sed -i "s/\[Project name\]/$REPO/" MASTER_PLAN.md
  echo "  ✅ Created MASTER_PLAN.md (fill in the details)"
else
  echo "  ⏭  Already exists"
fi

# ── 4. Required docs ────────────────────────────────────────────
echo "→ Required documentation..."
for FILE in CONTEXT.md ARCHITECTURE.md CHANGELOG.md; do
  if [[ ! -f "$FILE" ]]; then
    case $FILE in
      CONTEXT.md)      cp "$HOW_I_WORK/templates/CONTEXT.md" "$FILE" ;;
      ARCHITECTURE.md) cp "$HOW_I_WORK/templates/ARCHITECTURE.md" "$FILE" ;;
      CHANGELOG.md)
        cat > CHANGELOG.md << 'EOF'
# Changelog

All notable changes to this project will be documented here.
Format: [Keep a Changelog](https://keepachangelog.com/)

## [Unreleased]
EOF
        ;;
    esac
    echo "  ✅ Created $FILE"
  else
    echo "  ⏭  $FILE already exists"
  fi
done

# ── 5. ADR directory ────────────────────────────────────────────
echo "→ ADR directory..."
if [[ ! -d "docs/adr" ]]; then
  mkdir -p docs/adr
  echo "  ✅ Created docs/adr/"
else
  echo "  ⏭  Already exists"
fi

# ── 6. .gitignore base entries ──────────────────────────────────
echo "→ .gitignore..."
GITIGNORE_ENTRIES=".DS_Store\n*.env\n*.env.local\nnode_modules/\n__pycache__/\n*.pyc"
if [[ ! -f ".gitignore" ]]; then
  echo -e "$GITIGNORE_ENTRIES" > .gitignore
  echo "  ✅ Created .gitignore"
else
  # Add missing entries without duplicating
  while IFS= read -r line; do
    if ! grep -qF "$line" .gitignore 2>/dev/null; then
      echo "$line" >> .gitignore
    fi
  done <<< "$(echo -e "$GITIGNORE_ENTRIES")"
  echo "  ✅ Updated .gitignore"
fi

# ── 7. Commit changes ───────────────────────────────────────────
echo "→ Committing..."
git add .
if git diff --cached --quiet; then
  echo "  ⏭  Nothing to commit"
else
  git commit -m "chore: apply how-i-work methodology standards"
  echo "  ✅ Committed"
fi

# ── 8. Branch protection via GitHub API ─────────────────────────
echo "→ Branch protection on main..."
gh api \
  --method PUT \
  -H "Accept: application/vnd.github+json" \
  "/repos/$GITHUB_USER/$REPO/branches/main/protection" \
  --field required_status_checks=null \
  --field enforce_admins=true \
  --field required_pull_request_reviews='{"required_approving_review_count":1,"dismiss_stale_reviews":false}' \
  --field restrictions=null \
  --field allow_force_pushes=false \
  --field allow_deletions=false \
  > /dev/null 2>&1 && echo "  ✅ Branch protection enabled" || echo "  ⚠️  Branch protection failed (may need GitHub Pro for private repos)"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ $REPO is now on the factory standard"
echo ""
echo "Next steps:"
echo "  1. Fill in CLAUDE.md with project-specific context"
echo "  2. Update CONTEXT.md with current state"
echo "  3. git push"
echo "  4. Verify branch protection at: https://github.com/$GITHUB_USER/$REPO/settings/branches"
