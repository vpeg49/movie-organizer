# 🎬 movie-organizer

> Automatically organizes a personal movie collection on an external hard drive
> by querying TMDB metadata and sorting films by genre.

![Node](https://img.shields.io/badge/Node-v18.20.8-339933?logo=node.js&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-blue)
![Status](https://img.shields.io/badge/status-active-brightgreen)
![Movies](https://img.shields.io/badge/movies%20organized-246-orange)

---

## 📋 Table of contents

- [What it does](#-what-it-does)
- [Requirements](#-requirements)
- [Installation](#-installation)
- [Configuration](#-configuration)
- [Usage](#-usage)
- [Disk structure](#-disk-structure)
- [Helper scripts](#-helper-scripts)
- [Project rules](#-project-rules)
- [Roadmap](#-roadmap)

---

## 🎯 What it does

1. **Scans** a source folder with unsorted movie files
2. **Queries TMDB** to get genre, year and official title
3. **Moves** each movie into `_biblioteca/<genre>/`
4. **Carries the `.srt`** alongside the video automatically
5. **Caches** results in `movies.json` — no repeated API calls
6. **Reports** movies missing subtitles with a direct link to OpenSubtitles

---

## 📦 Requirements

- Node.js v18+
- npm v10+
- Free account at [TMDB](https://www.themoviedb.org/) to get an API key
- External drive mounted on Linux

---

## 🚀 Installation

\`\`\`bash
git clone https://github.com/TU_USUARIO/movie-organizer.git
cd movie-organizer
npm install
cp .env.example .env
\`\`\`

Edit \`.env\` with your values (see Configuration section).

---

## ⚙️ Configuration

Create your \`.env\` based on \`.env.example\`:

\`\`\`bash
# TMDB API — get your free key at https://www.themoviedb.org/settings/api
TMDB_API_KEY=your_api_key_here

# Language for titles and genres
TMDB_LANGUAGE=es-MX

# Source path — where your unsorted movies are
SOURCE_PATH=/mnt/your-drive/_movies

# Destination path — where the organized library will be created
DEST_PATH=/mnt/your-drive/_biblioteca

# Inbox path — for new movies (future use)
INBOX_PATH=/mnt/your-drive/_inbox

# Simulation mode — true = show what would happen, move nothing
DRY_RUN=true
\`\`\`

> ⚠️ **Never commit your \`.env\` to Git.** It is already in \`.gitignore\`.

---

## 🎮 Usage

### Dry run (no files moved)

\`\`\`bash
npm run dry-run
\`\`\`

Shows exactly what would be moved, without touching any file.

### Real migration

\`\`\`bash
npm run migrate
\`\`\`

Moves files to destination sorted by genre.

### Process inbox (coming soon)

\`\`\`bash
npm run inbox
\`\`\`

---

## 📂 Disk structure

After running the migration:

\`\`\`
Backup Plus/
├── _movies/              ← original folders (emptied)
├── _inbox/               ← new movies pending processing
└── _biblioteca/          ← ✅ organized library
    ├── accion/
    ├── animacion/
    ├── aventura/
    ├── comedia/
    ├── crimen/
    ├── documental/
    ├── drama/
    ├── familia/
    ├── fantasia/
    ├── historia/
    ├── musica/
    ├── romance/
    ├── sci-fi/
    ├── terror/
    ├── thriller/
    ├── western/
    └── sin-clasificar/   ← genre not found in TMDB
\`\`\`

---

## 🛠️ Helper scripts

### find-missing-srt.sh

Scans the library for movies without a subtitle file and generates
a direct search link to OpenSubtitles for each one:

\`\`\`bash
bash scripts/find-missing-srt.sh
\`\`\`

\`\`\`
🔍 Scanning: /mnt/your-drive/_biblioteca

❌ [accion] Terminator El Exterminador (1984).mp4
   🔗 https://www.opensubtitles.org/es/search2/sublanguageid-spa/moviename-Terminator+El+Exterminador

❌ [western] Lonesome Dove (1989).mp4
   🔗 https://www.opensubtitles.org/es/search2/sublanguageid-spa/moviename-Lonesome+Dove

────────────────────────────────────────────────
📄 Report saved to: missing-srt.txt
Total scanned: 245  |  Missing .srt: 67
\`\`\`

Full list is saved to \`missing-srt.txt\` at the project root.

---

## 📏 Project rules

| Rule | Detail |
|------|--------|
| \`DRY_RUN=true\` by default | Never moves files without explicit confirmation |
| Check destination first | Verifies file does not exist before moving |
| \`.srt\` travels with its video | Always moved together |
| No hardcoded paths | Everything goes in \`.env\` |
| TMDB timeout | File goes to \`/sin-clasificar\`, never a fatal error |
| \`movies.json\` is the source of truth | Cached results are never re-fetched |

---

## 📋 Roadmap

- [ ] \`npm run inbox\` — auto-process \`_inbox/\` folder
- [ ] Configure fixed UUID in \`/etc/fstab\` for the drive
- [ ] Integration with [soberania-multimedia](https://github.com/TU_USUARIO/soberania-multimedia)

---

## 🔗 Related projects

**[soberania-multimedia](https://github.com/TU_USUARIO/soberania-multimedia)**
— Jellyfin server on Docker to watch the library on Roku, no internet, no subscriptions.

---

## 📄 License

MIT © Paul
