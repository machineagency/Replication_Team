#!/bin/bash
# Run this once from the repo root with GitHub CLI installed:
#   gh auth login   (if not already authenticated)
#   bash .github/LABELS/create_labels.sh

REPO="$(gh repo view --json nameWithOwner -q .nameWithOwner)"
echo "Creating labels for: $REPO"

# ── Status labels ──────────────────────────────────────────
gh label create "status: queued"      --color "BFD4F2" --description "Project is in the queue for future replication" --repo "$REPO" --force
gh label create "status: in-progress" --color "F9D0C4" --description "Replication is actively underway" --repo "$REPO" --force
gh label create "status: completed"   --color "0E8A16" --description "Replication finished and documented" --repo "$REPO" --force
gh label create "status: on-hold"     --color "E4E669" --description "Paused — waiting on parts, access, or bandwidth" --repo "$REPO" --force
gh label create "status: rejected"    --color "D93F0B" --description "Will not replicate (out of scope, already covered, etc.)" --repo "$REPO" --force

# ── Difficulty labels ──────────────────────────────────────
gh label create "difficulty: low"     --color "C2E0C6" --description "Straightforward build with good documentation" --repo "$REPO" --force
gh label create "difficulty: medium"  --color "FEF2C0" --description "Moderate complexity, some troubleshooting expected" --repo "$REPO" --force
gh label create "difficulty: high"    --color "F9C8C8" --description "Complex build or sparse documentation" --repo "$REPO" --force
gh label create "difficulty: unknown" --color "EDEDED" --description "Difficulty not yet assessed" --repo "$REPO" --force

# ── Triage / admin labels ──────────────────────────────────
gh label create "needs-review"        --color "D4C5F9" --description "Submitted but not yet triaged by the team" --repo "$REPO" --force
gh label create "duplicate"           --color "CFD3D7" --description "Already submitted or in progress" --repo "$REPO" --force
gh label create "good first project"  --color "7057FF" --description "Recommended for newer team members" --repo "$REPO" --force

echo "✅ Done."
