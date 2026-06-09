# 📋 Quick Start Guide - CHANGELOG Management

## 📂 Files Created

1. **CHANGELOG.md** — Main changelog file with v1.0.0 initial release
2. **update-changelog.ps1** — PowerShell script (Windows-friendly) 
3. **update-changelog.js** — Node.js script (cross-platform)

---

## 🚀 Quick Usage

### Option 1: PowerShell (Recommended for Windows)

After you make changes and commit, run:

```powershell
# Add a new patch version (v1.0.0 → v1.0.1)
.\update-changelog.ps1 "Fixed shadow rendering" "Fixed"

# Add a new feature (v1.0.0 → v1.1.0)
.\update-changelog.ps1 "Added color theme picker" "Added" "minor"

# Major update (v1.0.0 → v2.0.0)
.\update-changelog.ps1 "Complete UI redesign" "Changed" "major"
```

### Option 2: Node.js

```bash
# Same commands as PowerShell
node update-changelog.js "Fixed shadow rendering" "Fixed"
node update-changelog.js "Added color theme picker" "Added" "minor"
```

### Option 3: Manual Update

Edit **CHANGELOG.md** directly:
1. Find the `## [Unreleased]` section
2. Add new changes under appropriate categories
3. When releasing, create new version section like:

```markdown
## [v1.0.1] - 2026-06-09

### Fixed
- Fixed shadow rendering issue (today)
- Improved logo loading (today)

### Added
- Added color theme picker (today)
```

---

## 📅 Categories to Use

- **Added** — new features
- **Changed** — changes in existing functionality
- **Fixed** — bug fixes
- **Deprecated** — soon-to-be removed features
- **Removed** — removed features
- **Security** — security fixes

---

## 🔄 Workflow Example

```bash
# 1. Make your changes to the code
# 2. Commit to git
git add .
git commit -m "add shadow effects"

# 3. Update CHANGELOG
.\update-changelog.ps1 "Added shadow effects to featured images" "Added"

# 4. Commit the changelog update
git add CHANGELOG.md
git commit -m "chore: update changelog for v1.0.1"

# 5. Done! Your changelog is now at v1.0.1
```

---

## 🤖 Auto-Update (Advanced)

To make updates **fully automatic** with Git hooks:

### On Windows (PowerShell):

1. Create `.git/hooks/post-commit` (no extension)
2. Add this content:

```bash
#!/bin/bash
# Auto-update relative dates in CHANGELOG.md
# (Run manual script or customize as needed)
```

3. Make it executable in Git Bash

### Or use a simpler approach:

Keep a reminder to run the changelog update script after each commit! ✅

---

## 📊 Your Current Version Status

**Current:** v1.0.0  
**Last Updated:** 2026-06-09  
**Total Commits:** 3  

Next version: **v1.0.1** (patch) or **v1.1.0** (minor) depending on changes

---

## 💡 Pro Tips

✅ Update changelog BEFORE pushing to avoid merge conflicts  
✅ Use consistent category names (Added, Fixed, etc.)  
✅ Add relative timestamps for recent changes: "(today)", "(1 day ago)"  
✅ Keep descriptions clear and user-focused  
✅ Reference issue numbers if applicable: "Fixed #42 - shadow rendering"

---

**Need help?** Run the script without arguments to see usage:
```powershell
.\update-changelog.ps1
# or
node update-changelog.js
```
