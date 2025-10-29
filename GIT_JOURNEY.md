# My Git Mastery Challenge Journey

## Student Information
- Name: Vyshnavi Kaki
- Student ID: 23A91A4426
- Repository: https://github.com/vyshnavi841/git-solved-23A91A4426
- Date Started: 2025-10-24
- Date Completed: 2025-10-28

## Task Summary
Cloned instructor's repository with pre-built conflicts and resolved all merge conflicts across multiple branches using proper Git workflows. Practiced stash, cherry-pick, rebase, revert, reset, reflog, tagging, and documenting work.

## Commands Used

| Command | Times Used | Purpose |
|---------|------------|---------|
| git clone | 1 | Clone instructor's repository |
| git checkout | 20+ | Switch between branches |
| git branch | 10+ | View & create branches |
| git merge | 3 | Merge dev & conflict-simulator into main |
| git add | 30+ | Stage resolved conflicts and changes |
| git commit | 15+ | Commit resolved changes |
| git push | 12+ | Push to my repository |
| git fetch | 3 | Fetch updates from instructor/origin |
| git pull | 2 | Pull remote updates |
| git stash | 2 | Save temporary changes when switching branches |
| git cherry-pick | 2 | Copy specific commit(s) between branches |
| git rebase | 1 | Rebase feature branch onto updated main |
| git reset | 3 | Undo commits (soft/mixed/hard) |
| git revert | 1 | Safely revert a commit by creating inverse commit |
| git reflog | 1 | Recover lost commits |
| git tag | 2 | Create annotated release tags |
| git status | 50+ | Check repository state |
| git log | 30+ | View history |
| git diff | 20+ | Compare changes |

---

## Conflicts Resolved

### Merge 1: main + dev (6 files)

#### Conflict 1: config/app-config.yaml
- **Issue**: Production used port `8080` and `ssl_enabled: true`; dev used `port: 3000` and `debug_mode: true`.
- **Resolution**: Created a unified config with `production` as default and a `development` profile:
  ```yaml
  server:
    port: 8080
    ssl_enabled: true

  development:
    enabled: false
    port: 3000
    debug_mode: false
  ```
- **Strategy**: Keep production stable; add dev profile for local testing.
- **Difficulty**: Medium
- **Time**: 15 minutes

#### Conflict 2: config/database-config.json
- **Issue**: Different hosts and SSL modes.
- **Resolution**: Introduced `production` and `development` objects:
  ```json
  {
    "production": { "host": "prod-db.example.com", "ssl_mode": "require" },
    "development": { "host": "localhost", "ssl_mode": "disable" }
  }
  ```
- **Strategy**: Keep prod secure, dev local credentials.
- **Difficulty**: Medium
- **Time**: 10 minutes

#### Conflict 3: scripts/deploy.sh
- **Issue**: Production uses cloud deploy steps, dev branch used docker-based flow.
- **Resolution**: Merge to a script that accepts `DEPLOY_ENV` and runs appropriate steps:
  ```bash
  if [ "$DEPLOY_ENV" = "production" ]; then
    # production steps
  else
    # development/local steps
  fi
  ```
- **Strategy**: Add conditional environment logic.
- **Difficulty**: Hard
- **Time**: 20 minutes

#### Conflict 4: scripts/monitor.js
- **Issue**: Different log formats and intervals.
- **Resolution**: Add environment-based config object and keep default production format.
- **Strategy**: Determine interval from `process.env.NODE_ENV` and use JSON logs for production.
- **Difficulty**: Medium
- **Time**: 15 minutes

#### Conflict 5: docs/architecture.md
- **Issue**: Different architecture diagrams & wording.
- **Resolution**: Combined diagrams and added a "Production vs Development" section.
- **Strategy**: Preserve both descriptions under separate headings.
- **Difficulty**: Easy
- **Time**: 10 minutes

#### Conflict 6: README.md
- **Issue**: Different feature lists and version numbers.
- **Resolution**: Consolidated features and added "Maintainer" + version notes.
- **Strategy**: Document differences and keep production version numbers as authority.
- **Difficulty**: Easy
- **Time**: 10 minutes

---

### Merge 2: main + conflict-simulator (6 files)

> _This merge simulated intentional conflicts for practice. I followed the same process as Merge 1: inspect diffs, decide strategy (prefer production stability), remove conflict markers, test, stage, commit._

#### Conflict A: scripts/monitor.js
- **Issue**: `conflict-simulator` added an experimental logging field `trace_id` and changed interval to `2s`.
- **Resolution**: Kept production interval `30s`, added optional `trace_id` field behind a feature flag:
  ```js
  const config = {
    interval: process.env.NODE_ENV === 'development' ? 2000 : 30000,
    enableTrace: process.env.FEATURE_TRACE === 'true'
  };
  ```
- **Strategy**: Experimental features behind flags.
- **Difficulty**: Medium
- **Time**: 12 minutes

#### Conflict B: config/app-config.yaml
- **Issue**: `conflict-simulator` added `experimental: true` block.
- **Resolution**: Added `experimental` section commented-out and documented as non-production:
  ```yaml
  # experimental:
  #   feature_x: true  # disabled by default
  ```
- **Strategy**: Comment out experimental features but document them.
- **Difficulty**: Easy
- **Time**: 8 minutes

#### Conflict C: scripts/deploy.sh
- **Issue**: conflict-simulator replaced deploy commands with test harness.
- **Resolution**: Combined the flow and added `--dry-run` option for test deployments.
- **Strategy**: Provide a safe test path and real deploy path.
- **Difficulty**: Medium
- **Time**: 15 minutes

#### Conflict D: docs/architecture.md
- **Issue**: Minor wording conflicts.
- **Resolution**: Merged both descriptions, added a note: "Experimental features not production-ready".
- **Strategy**: Keep both paragraphs where they add value.
- **Difficulty**: Easy
- **Time**: 10 minutes

#### Conflict E: config/database-config.json
- **Issue**: conflict-simulator suggested a new replica config.
- **Resolution**: Added optional `replica` block documented for production only.
- **Strategy**: Keep production as single source and add optional blocks.
- **Difficulty**: Medium
- **Time**: 10 minutes

#### Conflict F: README.md
- **Issue**: conflict-simulator had sample experimental instructions.
- **Resolution**: Merged the sample but added a warning and commented-out commands for experimental features.
- **Strategy**: Document but not enable by default.
- **Difficulty**: Easy
- **Time**: 8 minutes

---

## Most Challenging Parts
1. Understanding conflict markers and HEAD vs incoming branch.
2. Combining complex shell script logic safely.
3. Testing after resolution to ensure no regressions.

## Key Learnings
- Use `git status` frequently.
- Use `git checkout --theirs` / `--ours` as last resorts.
- Use `git stash` when you need to switch contexts.
- Reflog saves you when history gets reset.

## Evidence & Checkpoints
- Checkpoint 1: `git log --oneline --graph --all` after first merge — saved screenshot `checkpoint1.png`
- Checkpoint 2: `git log --oneline --graph --all` after second merge — saved screenshot `checkpoint2.png`

## Reflection
This challenge improved my confidence resolving merge conflicts and using advanced Git commands (stash, cherry-pick, rebase, reflog). I now prefer reading both sides before deciding and documenting rationale for merges.

