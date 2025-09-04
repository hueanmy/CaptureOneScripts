# CaptureOneScripts 🚀

[![GitHub stars](https://img.shields.io/github/stars/your-username/CaptureOneScripts?style=flat-square)](https://github.com/your-username/CaptureOneScripts/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/your-username/CaptureOneScripts?style=flat-square)](https://github.com/your-username/CaptureOneScripts/issues)
[![GitHub last commit](https://img.shields.io/github/last-commit/your-username/CaptureOneScripts?style=flat-square)](https://github.com/your-username/CaptureOneScripts/commits/main)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](LICENSE)

---

A collection of **Capture One AppleScripts** and small helpers to automate real-world workflows —
**session favorites**, **batch export**, **rename**, **cropping info**, and more.  
Tested with **Capture One 16.6.5.17** and macOS Sonoma.

> This repo focuses on *updated scripts* and *bug‑workarounds* for newer Capture One versions (e.g. the `current document` AppleScript regression in 16.6.5.17).

---

## ✨ Features
- Ready-to-use AppleScripts for everyday tasks
- Workarounds for `Can't get current document` on 16.6.5.17
- Clear setup guide (paths, permissions, Script menu)
- TypeScript helpers for integration projects (optional)

---

## ✅ Compatibility
| Component | Version |
|---|---|
| macOS | Ventura / Sonoma |
| Capture One | **16.6.5.17** (and most 16.6.x) |
| Scripting | AppleScript (.scpt / .applescript) |
| Optional helpers | Node.js / TypeScript (.ts) |

> If you hit a version‑specific error, please open an Issue with your Capture One build number.

---

## 📦 Installation
1. **Clone / download** the repo
   ```bash
   git clone https://github.com/your-username/CaptureOneScripts.git
   ```
2. **Copy AppleScripts** into the Capture One scripts folder:
   ```
   ~/Library/Scripts/Capture One/
   ```
   Create folders if they don't exist.
3. In **Capture One → Preferences → Plugins / Scripts**, enable the **Scripts menu**.
4. Run from the **Scripts** icon in the Capture One toolbar.

> For `.ts` helpers (optional), you can run them with `ts-node` or transpile to JS first. These are for developers who integrate C1 into larger apps.

---

## 📚 Script Catalog
> **AppleScript** files can be run directly inside Capture One. **.ts** files are developer helpers (Node/TS).

| File | Type | What it does |
|---|---|---|
| `addNewSession.applescript` | AppleScript | Create a new Session. |
| `addNewSessionAndSessionFavoritesAsCapture....applescript` | AppleScript | Create Session and add Session Favorites (as Capture folders). |
| `addNewSessionFavoritesAsCapture copy.applescript` | AppleScript | Add multiple Session Favorites as Capture. |
| `getAllVariantsCropping_ForCaptureFile.scpt` | AppleScript | Read cropping info for current capture file. |
| `getAllVariantsCropping_ForCaptureFile.applescript` | AppleScript | Same as above in text form. |
| `getAllVariantsCropping_ForOutputFile.applescript` | AppleScript | Read cropping info mapped to output files. |
| `getAllVariantsCropping_ForOutputFile.ts` | TypeScript | Helper to parse/format cropping info. |
| `getAllVariantsCropping_ForOutputFile_old.applescript` | AppleScript | Legacy variant kept for reference. |
| `getAllVariantsCroppingAndOutput.applescript` | AppleScript | Dump cropping + output mapping for all variants. |
| `getAllVariantsCroppingAndOutput.ts` | TypeScript | Programmatic version of the above. |
| `getAllVariantsCroppingEIP.applescript` | AppleScript | Cropping info for EIP workflow. |
| `getCaptureOneSessionFolders.ts` | TypeScript | Read Session folder structure (Capture, Selects, Output, Trash). |
| `checkCaptureOneConnection.ts` | TypeScript | Quick sanity check that Capture One responds to AppleScript. |
| `checkCaptureOneVersion.ts` | TypeScript | Read C1 version for diagnostics. |
| `checkSessionFolders.ts` | TypeScript | Validate session folders exist and are writable. |
| `ignoreCrop.ts` | TypeScript | Helper to bypass cropping for downstream steps. |
| `setCaptureName.ts` | TypeScript | Set Capture Naming token programmatically. |
| `setCaptureNameFormat.ts` | TypeScript | Set the naming **format** (token template). |

> Filenames may be shortened in the table for readability—see the repo tree for exact names.

---

## 🚀 Quick Start Examples

### 1) Add Session Favorite safely (AppleScript)
This version first tries `current document`. If it fails (16.6.5.17), it falls back to `document 1`.

```applescript
tell application "Capture One 23"
  try
    set docRef to current document
  on error
    if (count of documents) > 0 then
      set docRef to document 1
    else
      error "No open session/document in Capture One."
    end if
  end try

  tell docRef
    set myFolder to (choose folder with prompt "Pick a folder to add as Session Favorite")
    set favName to name of (info for myFolder)
    if (exists session favorite named favName) then
      delete session favorite named favName
    end if
    make new session favorite with properties {name:favName, path:myFolder, kind:capture}
  end tell
end tell
```

### 2) Read cropping for current capture (AppleScript)
```applescript
tell application "Capture One 23"
  tell current document
    set theVariants to variants
    repeat with v in theVariants
      set cropInfo to crop of v
      log cropInfo
    end repeat
  end tell
end tell
```

> Save scripts to `~/Library/Scripts/Capture One/` then run from the Scripts menu.

---

## 🔐 macOS Permissions
To allow automation:
1. **System Settings → Privacy & Security → Automation**  
   - Allow your script host (or app that triggers AppleScript) to control **Capture One**.
2. If your workflow writes outside your home folder, you may need **Full Disk Access** for your host app.

---

## 🧰 Troubleshooting
- **Error:** `Can’t get current document`  
  → Open a Session/Document first, or use the fallback pattern (`document 1`).  
- **Nothing happens when running a script**  
  → Check the Scripts menu is enabled and the file is in the correct folder.  
- **Permission denied**  
  → Re-check Automation permissions; restart Capture One after changing settings.
- **16.6.5.17 specific issues**  
  → Report via Issues with logs; we maintain workarounds in this repo.

---

## 🗺 Roadmap
- [ ] More robust favorites manager (multi‑select UI)
- [ ] Batch export presets by style/variant
- [ ] Session diagnostics (permissions, folders, tokens)
- [ ] Example Node/Electron integration snippets

---

## 🤝 Contributing
PRs welcome! Please include:
- A short description and test steps
- Capture One version used
- Screenshots/GIFs where helpful

---

## 📜 License
[MIT](LICENSE) — free to use, modify, and share.
