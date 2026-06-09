# CHANGELOG Auto-Update Helper (PowerShell)
# Usage: .\update-changelog.ps1 "Feature name" "Category" "version_bump"
# 
# Categories: Added, Changed, Fixed, Deprecated, Removed, Security
# Version bumps: patch (default), minor, major

param(
    [string]$Description = "",
    [string]$Category = "Changed",
    [string]$VersionBump = "patch"
)

if (-not $Description) {
    Write-Host @"
📝 CHANGELOG Auto-Update Helper (PowerShell)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Usage: .\update-changelog.ps1 "description" "category" "version_bump"

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
  .\update-changelog.ps1 "Fixed upload bug" "Fixed" "patch"
  .\update-changelog.ps1 "Added color picker" "Added" "minor"
  .\update-changelog.ps1 "Redesigned UI" "Changed"
"@
    exit 0
}

$changelogPath = Join-Path $PSScriptRoot "CHANGELOG.md"

if (-not (Test-Path $changelogPath)) {
    Write-Host "❌ CHANGELOG.md not found!" -ForegroundColor Red
    exit 1
}

# Read current changelog
$content = Get-Content $changelogPath -Raw

# Extract current version
if ($content -match '\## \[v(\d+)\.(\d+)\.(\d+)\]') {
    $major = [int]$matches[1]
    $minor = [int]$matches[2]
    $patch = [int]$matches[3]
} else {
    Write-Host "❌ Could not find version in CHANGELOG.md" -ForegroundColor Red
    exit 1
}

# Bump version
switch ($VersionBump.ToLower()) {
    "major" {
        $major++
        $minor = 0
        $patch = 0
    }
    "minor" {
        $minor++
        $patch = 0
    }
    default {
        $patch++
    }
}

$newVersion = "v$major.$minor.$patch"
$today = (Get-Date).ToString("yyyy-MM-dd")

# Create new version section
$newSection = @"
## [$newVersion] - $today

### $Category
- **$Description** (today)

---

"@

# Insert new version after [Unreleased] section
$unreleasedIndex = $content.IndexOf("## [Unreleased]")
$nextVersionIndex = $content.IndexOf("`n---`n", $unreleasedIndex)

if ($unreleasedIndex -eq -1 -or $nextVersionIndex -eq -1) {
    Write-Host "❌ Could not find [Unreleased] section in CHANGELOG.md" -ForegroundColor Red
    exit 1
}

$insertPosition = $nextVersionIndex + 5
$updatedContent = $content.Substring(0, $insertPosition) + "`n" + $newSection + $content.Substring($insertPosition)

# Write updated changelog
Set-Content -Path $changelogPath -Value $updatedContent

Write-Host @"

✅ Changelog Updated!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Version: $newVersion
Category: $Category
Change: $Description
Date: $today

Next steps:
  git add CHANGELOG.md
  git commit -m "chore: update changelog for $newVersion"
"@ -ForegroundColor Green
