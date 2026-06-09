# Changelog

All notable changes to the WP Doc Featured Image Generator project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

### Planned
- (Add upcoming features/changes here)

---

## [v1.0.0] - 2026-06-08

### Added
- **Initial Project Setup** (1 day ago)
  - Created main project files (.claude/launch.json, README.md)
  - Initialized Git repository
  
- **Index.html File Changes** (1 day ago)
  - Updated index.html with initial content
  - Added one file configuration changes

- **Shadow Effect Enhancement** (1 day ago)
  - Added shadow styling to improve UI appearance
  - Enhanced visual design of the featured image generator

### Project Features
- Zero dependencies — pure HTML + CSS + JavaScript
- Uses Canvas API for in-browser image generation (1200×630)
- Auto-fetches title and category from WordPress REST API
- Automatic logo rendering (WDesignKit + POSIMYTH)
- localStorage integration for settings persistence
- Bulk-friendly operation
- Direct upload to WordPress as featured image
- Customizable colour pickers for badge and background

---

## Version Management Guide

### 🚀 How to Update Changelog Automatically

When you make commits, follow these steps to update the changelog:

1. **After making changes and committing:**
   ```bash
   git log --since="last version" --oneline
   ```

2. **Add new section at the top under [Unreleased]:**
   - Move completed items from Unreleased → New Version Section
   - Use format: ## [vX.Y.Z] - YYYY-MM-DD
   - Add relative timestamps using: `(X days ago)`, `(1 day ago)`, `(today)`

3. **Version Numbering:**
   - **MAJOR** (v1.0.0 → v2.0.0): Breaking changes
   - **MINOR** (v1.0.0 → v1.1.0): New features
   - **PATCH** (v1.0.0 → v1.0.1): Bug fixes

### 📅 Quick Date Format Examples
- **Today:** `(today)`
- **1 day ago:** `(1 day ago)`
- **2-6 days ago:** `(X days ago)`
- **7+ days ago or past:** Use full date as backup
- **Future commits:** `(next update)`

### 🔧 Optional: Auto-Update Hook (Advanced)

To auto-update timestamps, create a Git post-commit hook:

1. Create file: `.git/hooks/post-commit`
2. Add script to update relative dates
3. Make executable: `chmod +x .git/hooks/post-commit`

---

**Last Updated:** 2026-06-09  
**Current Version:** v1.0.0  
**Total Commits:** 3
