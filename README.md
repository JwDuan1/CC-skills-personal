# CC-skills-personal

Personal collection of [Claude Code](https://claude.com/claude-code) **skills**, packaged so they can be installed on any machine.

This repo contains **59 skills + a `_shared/` support folder** (see [SKILLS.md](SKILLS.md) for the full list). All symlinks have been dereferenced into real folders, so the bundle is fully self-contained and portable across machines (Windows / macOS / Linux).

> Plugins (`superpowers`, `frontend-design`, `ralph-skills`, `claude-hud`) are **not** bundled here — they are managed by Claude Code's plugin system and must be installed via the `/plugin` menu. See [Plugins](#plugins) below.

## Install on a new machine

Skills live in `~/.claude/skills/`. Clone this repo and run the installer, which copies every folder under `skills/` into `~/.claude/skills/` (overwriting same-named folders):

**Windows (PowerShell):**
```powershell
git clone https://github.com/JwDuan1/CC-skills-personal.git
cd CC-skills-personal
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

**macOS / Linux:**
```bash
git clone https://github.com/JwDuan1/CC-skills-personal.git
cd CC-skills-personal
bash install.sh
```

Then restart Claude Code so it discovers the new skills.

> Manual alternative: just copy everything inside `skills/` into `~/.claude/skills/`.

## Plugins

These were installed via Claude Code's plugin marketplaces, not as loose skills. On a new machine, install them through the `/plugin` menu so you get the latest versions plus their commands/hooks/agents:

| Plugin | Marketplace (GitHub) | Install command |
|---|---|---|
| superpowers | `anthropics/claude-plugins-official` | `/plugin install superpowers@claude-plugins-official` |
| frontend-design | `anthropics/claude-plugins-official` | `/plugin install frontend-design@claude-plugins-official` |
| ralph-skills | `snarktank/ralph` | `/plugin install ralph-skills@ralph-marketplace` |
| claude-hud | `jarrodwatts/claude-hud` | `/plugin install claude-hud@claude-hud` |

If a marketplace isn't registered yet, add it first, e.g.:
```
/plugin marketplace add anthropics/claude-plugins-official
/plugin marketplace add snarktank/ralph
/plugin marketplace add jarrodwatts/claude-hud
```
Update existing plugins from the `/plugin` menu (→ Update).

## Keeping skills up to date

- **nature-* skills** (the Nature suite + `_shared/`) track upstream [`Yuan1z0825/nature-skills`](https://github.com/Yuan1z0825/nature-skills). Re-pull there and re-run the installer to refresh.
- **planning-with-files** tracks [`OthmanAdi/planning-with-files`](https://github.com/OthmanAdi/planning-with-files).
- Most other skills are flat copies without a tracked upstream.
- **Plugins** update via the `/plugin` menu only.

## Notes

- Scanned for hardcoded secrets/API keys before publishing — none found. Skills that call external models (e.g. image/diagram generation) read keys from environment variables, not from files in this repo.
- Skill content is authored by their respective upstream authors; this repo is a personal, portable snapshot for cross-machine use.
