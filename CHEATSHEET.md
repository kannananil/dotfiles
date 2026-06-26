# CLI Cheat Sheet

Quick reference for the modern tools replacing familiar Unix defaults.

---

## eza — ls replacement

| Old | New | What it does |
|-----|-----|--------------|
| `ls` | `ls` | List with icons, dirs first |
| `ls -la` | `ll` | Long list with git status, icons |
| — | `lt` | Tree view, 2 levels deep |
| — | `ltt` | Tree view, 3 levels deep |

**Tips:**
- `ll` shows a `git` column — `M` modified, `N` new, `D` deleted
- `lt` is great for quickly seeing a project's structure

---

## zoxide — cd replacement

`cd` now uses `zoxide`. It learns from your navigation history.

| Command | What it does |
|---------|--------------|
| `cd projects/myapp` | Normal cd (works as before) |
| `cd myapp` | Jumps to the most-visited dir matching "myapp" |
| `cd` | Goes home (unchanged) |
| `zi` | Interactive fuzzy picker for recent dirs |

After normal use for a few days, `cd` partial names will start resolving automatically.

---

## fzf — fuzzy finder

Installed globally. Key bindings work anywhere in your shell:

| Shortcut | What it does |
|----------|--------------|
| `Ctrl+R` | Fuzzy search shell history — start typing any part of a command |
| `Ctrl+T` | Fuzzy insert a file path at the cursor |
| `Alt+C` | Fuzzy cd into a subdirectory |

**Tips:**
- `Ctrl+R` is the killer feature — search history by any fragment, not just the start
- Combine with `**<Tab>`: type `vim **<Tab>` and get a fuzzy file picker

---

## bat — cat replacement

`cat` now uses `bat`. It adds syntax highlighting and line numbers.

| Old | New |
|-----|-----|
| `cat file.js` | `cat file.js` (aliased, same command) |
| `cat file \| less` | `bat file` — bat has built-in paging |

**Tips:**
- `bat --plain file` strips line numbers for copy-pasting
- `bat --language=json file` forces a language

---

## ripgrep (rg) — grep replacement

`grep` now uses `rg`. It's faster and ignores `.git`, `node_modules`, etc. by default.

| Old | New |
|-----|-----|
| `grep -r "foo" .` | `grep "foo"` or `rg "foo"` |
| `grep -rl "foo" .` | `rg -l "foo"` |
| `grep -rn "foo" .` | `rg -n "foo"` (default shows line numbers) |

**Tips:**
- `rg "foo" --type ts` — search only TypeScript files
- `rg "foo" -C 3` — show 3 lines of context

---

## fd — find replacement

`find` now uses `fd`. Ignores `.git` and respects `.gitignore` by default.

| Old | New |
|-----|-----|
| `find . -name "*.ts"` | `find "*.ts"` or `fd ".ts"` |
| `find . -type d -name "dist"` | `fd -t d dist` |
| `find . -name "*.log" -delete` | `fd -e log -x rm` |

**Tips:**
- `fd` with no args lists everything in current dir (respecting .gitignore)
- `fd -H` includes hidden files

---

## Git aliases

| Alias | Command | What it does |
|-------|---------|--------------|
| `glog` | `git log --oneline --decorate --graph --all` | Visual branch graph |
| `gap` | `git add -p` | Stage changes interactively (hunk by hunk) |
| `gco` | `git checkout` | — |
| `gcb` | `git checkout -b` | Create and switch branch |
| `gsh` | `git stash` | — |
| `gshl` | `git stash list` | — |
| `gsha` | `git stash apply` | — |
| `grs` | `git restore --staged` | Unstage a file |
| `gundo` | `git reset --soft HEAD~1` | Undo last commit, keep changes staged |
| `gri` | `git rebase -i` | Interactive rebase |
| `gcp` | `git cherry-pick` | — |

---

## Other utility aliases

| Alias | What it does |
|-------|--------------|
| `du` | `dust` — visual disk usage with a bar chart |
| `df` | `duf` — disk free with colour and context |
| `top` | `btop` — interactive system monitor (mouse support) |
| `path` | Print `$PATH` one entry per line |
| `reload` | `source ~/.zshrc` — reload config without opening new terminal |
| `..` `...` `....` | Go up 1 / 2 / 3 directory levels |

---

## Shell history tricks

- Prefix any command with a **space** to keep it out of history (useful for secrets)
- `Ctrl+R` — fuzzy history search via fzf (replaces the old reverse-i-search)
- History is shared across all open terminals in real time (`SHARE_HISTORY`)
