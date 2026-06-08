# WP Doc Featured Image Generator — Browser JS

A **single HTML file** tool. No Node.js, no npm, no installation needed.

Just open `index.html` in any browser → paste a WordPress doc URL → click Generate.

---

## How to Use

1. **Open `index.html`** in Chrome, Firefox, Edge, or Safari
2. Enter your **WordPress Site URL** (e.g. `https://wdesignkit.com`)
3. Enter the **Doc Page URL** (e.g. `https://wdesignkit.com/docs/some-page/`)
4. Click **Generate Image**
5. **Download PNG** — or click **Set as Featured Image** to upload directly to WordPress

### To upload directly to WordPress
Click **Auth (needed to upload)** and enter:
- Your WordPress **username**
- An **Application Password** — generate at:
  `WP Admin → Users → Profile → Application Passwords`

---

## Features

- Zero dependencies — pure HTML + CSS + JavaScript
- Uses the **Canvas API** to draw the 1200×630 image in-browser
- Auto-fetches **title and category** from the WordPress REST API
- Downloads and renders **WDesignKit + POSIMYTH logos** automatically
- **Saves settings** (site URL, brand choices) to localStorage
- **Bulk-friendly** — run for any URL in seconds
- Uploads generated PNG as **WordPress featured image** via REST API
- Colour pickers for badge and background customisation

---

## Design

```
┌──────────────────────────────────────────────────────────┐
│  [WDesignKit logo]                   [POSIMYTH logo]     │
│                                                          │
│                  ╔══════════════════╗                    │
│                  ║  Getting Started  ║  ← green badge    │
│                  ╚══════════════════╝                    │
│                                                          │
│        How to Get License Key for WDesignKit             │
│                   Activation?                            │
└──────────────────────────────────────────────────────────┘
              1200 × 630 px  ·  PNG
```

---

## Customisation

All design settings are exposed in the **Advanced options** panel inside the tool:

| Setting | Default |
|---------|---------|
| Left brand logo | WDesignKit |
| Right brand logo | POSIMYTH |
| Title font size | 64 px (auto-shrinks for long titles) |
| Badge colour | `#34C759` green |
| Background colour | `#0B1354` dark navy |

To add new brand logos, edit the `BRAND_LOGOS` object at the top of the `<script>` in `index.html`.

---

## File Structure

```
wp-doc-image-generator-js/
└── index.html   ← the entire tool (HTML + CSS + JS, ~400 lines)
```

That's it. One file.

---

## Requirements

- Any modern browser (Chrome 90+, Firefox 88+, Edge 90+, Safari 15+)
- Internet connection (to fetch page metadata and logos)
- WordPress Application Password to upload (optional)
