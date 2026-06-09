#!/usr/bin/env node

/**
 * CHANGELOG Auto-Update Helper
 * Usage: node update-changelog.js "Feature name" "Category" [version_bump]
 * 
 * Example:
 *   node update-changelog.js "Added shadow effects" "Added" "patch"
 *   node update-changelog.js "New upload feature" "Added" "minor"
 */

const fs = require('fs');
const path = require('path');

const args = process.argv.slice(2);
const changeDescription = args[0] || 'New changes';
const category = args[1] || 'Changed';
const versionBump = args[2] || 'patch';

if (args.length === 0) {
  console.log(`
📝 CHANGELOG Auto-Update Helper
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Usage: node update-changelog.js "<description>" "<category>" [version_bump]

Categories:
  - Added      (new features)
  - Changed    (changes in existing functionality)
  - Fixed      (bug fixes)
  - Deprecated (features being removed)
  - Removed    (removed features)
  - Security   (security fixes)

Version Bumps:
  - patch (default): v1.0.0 → v1.0.1
  - minor: v1.0.0 → v1.1.0
  - major: v1.0.0 → v2.0.0

Examples:
  node update-changelog.js "Fixed upload bug" "Fixed" "patch"
  node update-changelog.js "Added color picker" "Added" "minor"
  node update-changelog.js "Redesigned UI" "Changed"
  `);
  process.exit(0);
}

const changelogPath = path.join(__dirname, 'CHANGELOG.md');

// Read current changelog
let content = fs.readFileSync(changelogPath, 'utf-8');

// Extract current version
const versionMatch = content.match(/## \[v(\d+)\.(\d+)\.(\d+)\]/);
if (!versionMatch) {
  console.error('❌ Could not find current version in CHANGELOG.md');
  process.exit(1);
}

let [, major, minor, patch] = versionMatch.map(Number);

// Bump version
switch (versionBump.toLowerCase()) {
  case 'major':
    major++;
    minor = 0;
    patch = 0;
    break;
  case 'minor':
    minor++;
    patch = 0;
    break;
  case 'patch':
  default:
    patch++;
}

const newVersion = `v${major}.${minor}.${patch}`;
const today = new Date().toISOString().split('T')[0];

// Create new version section
const newSection = `## [${newVersion}] - ${today}

### ${category}
- **${changeDescription}** (today)

---

`;

// Insert new version after [Unreleased] section
const unreleasedIndex = content.indexOf('## [Unreleased]');
const nextVersionIndex = content.indexOf('\n---\n', unreleasedIndex);

if (unreleasedIndex === -1 || nextVersionIndex === -1) {
  console.error('❌ Could not find [Unreleased] section in CHANGELOG.md');
  process.exit(1);
}

const insertPosition = nextVersionIndex + 5;
const updatedContent = content.slice(0, insertPosition) + '\n' + newSection + content.slice(insertPosition);

// Write updated changelog
fs.writeFileSync(changelogPath, updatedContent, 'utf-8');

console.log(`
✅ Changelog Updated!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Version: ${newVersion}
Category: ${category}
Change: ${changeDescription}
Date: ${today}

Next steps:
  git add CHANGELOG.md
  git commit -m "chore: update changelog for ${newVersion}"
`);
