# Dotfiles Improvement Plan

Scope: `.zshrc`, `kitty.conf`, `.vimrc`, `Brewfile`, `VSCode settings.json`
Excluded: tmux, fish, alacritty (no longer in use)

---

## 1. `.zshrc` — Shell Performance & Usability

### 1a. Fix Startup Latency (High Priority)

Three tools currently load on every shell open and add ~600–800ms combined:

**Lazy-load NVM** (~300–500ms saved):
```zsh
export NVM_DIR="$HOME/.nvm"
nvm() {
  unfunction nvm node npm npx
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
  nvm "$@"
}
node()  { nvm use default --silent; node "$@" }
npm()   { nvm use default --silent; npm "$@" }
npx()   { nvm use default --silent; npx "$@" }
```

**Lazy-load Conda** (~200ms saved):
```zsh
conda() {
  unfunction conda
  __conda_setup="$('/Users/kannananil/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
  [ $? -eq 0 ] && eval "$__conda_setup" || export PATH="/Users/kannananil/opt/anaconda3/bin:$PATH"
  unset __conda_setup
  conda "$@"
}
```

**Lazy-load gcloud** (~100ms saved):
```zsh
gcloud() {
  unfunction gcloud
  [ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ] && . "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"
  [ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ] && . "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"
  gcloud "$@"
}
```

### 1b. Modern Tool Replacements

Replace `autojump` with `zoxide` (smarter, faster):
```zsh
# Remove:  [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
# Add:
eval "$(zoxide init zsh)"
alias cd='z'
```

Replace `ls` with `eza`:
```zsh
alias ls='eza --icons --group-directories-first'
alias ll='eza -la --icons --git --group-directories-first'
alias lt='eza --tree --level=2 --icons'
alias ltt='eza --tree --level=3 --icons'
```

### 1c. Better History Settings

Add after `source $ZSH/oh-my-zsh.sh`:
```zsh
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE      # prefix a command with space to keep it out of history
setopt HIST_VERIFY
setopt SHARE_HISTORY
```

### 1d. fzf Integration

Install fzf (`brew install fzf && $(brew --prefix)/opt/fzf/install`), then add:
```zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --preview "bat --color=always {}"'
export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'
```
Key bindings enabled by default after install:
- `Ctrl+R` — fuzzy search shell history
- `Ctrl+T` — fuzzy insert file path
- `Alt+C` — fuzzy cd into directory

### 1e. Quality-of-Life Shell Options
```zsh
setopt AUTO_CD          # type a directory name to cd into it
setopt NO_BEEP
setopt CORRECT          # suggest corrections for mistyped commands
```

### 1f. Additional Useful Aliases
```zsh
# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Utilities
alias cat='bat'                          # syntax-highlighted cat
alias grep='rg'                          # fast grep
alias find='fd'                          # fast find
alias du='dust'                          # visual disk usage
alias df='duf'                           # disk free with context
alias top='btop'                         # system monitor

# Git (extend your existing set)
alias glog='git log --oneline --decorate --graph --all'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gri='git rebase -i'
alias gcp='git cherry-pick'
alias grs='git restore --staged'
alias gundo='git reset --soft HEAD~1'

# Misc
alias myip='curl -s https://ipecho.net/plain; echo'
alias path='echo $PATH | tr ":" "\n"'   # readable PATH
alias reload='source ~/.zshrc'
```

### 1g. Housekeeping

- Replace all hardcoded `/Users/anilmuraleedharan/` with `$HOME/` for portability
- Remove the broken alias `gsha-'git stash apply'` (missing `=`)
- Remove `travis` source block (outdated CI service)
- Set `EDITOR` and `VISUAL`:
  ```zsh
  export EDITOR='vim'
  export VISUAL='code'
  ```

---

## 2. `kitty.conf` — Terminal Polish

### 2a. Fix Duplicate Binding

`ctrl+shift+z` is bound twice (lines 89 and 128). Remove the second one.

### 2b. Use `kitty_mod` for Cleaner Config

```conf
kitty_mod ctrl+shift
# Then replace all ctrl+shift+ prefixes with kitty_mod+
```

### 2c. Enable Remote Control (Useful for Scripting)

```conf
allow_remote_control yes
listen_on unix:/tmp/mykitty
```
This lets you script kitty from the shell: `kitty @ new-window`, useful with fzf.

### 2d. Better Tab Bar

```conf
tab_bar_style powerline
tab_powerline_style round
tab_bar_min_tabs 2             # only show tab bar when >1 tab exists
tab_title_template "{index}: {title}"
active_tab_foreground   #f38ba8
active_tab_background   #1e1e2e
inactive_tab_foreground #a6adc8
inactive_tab_background #181825
```

### 2e. URL Handling

```conf
url_color #7aa6da
url_style curly
open_url_with default
detect_urls yes
```

### 2f. Performance & Misc

```conf
repaint_delay 10
input_delay 3
sync_to_monitor yes
enable_audio_bell no           # already set, keep it
```

### 2g. Clipboard Shortcut

```conf
map kitty_mod+c copy_to_clipboard
map kitty_mod+v paste_from_clipboard
```

---

## 3. `.vimrc` — Editor Modernisation

### 3a. Add vim-plug (Plugin Manager)

Add to the top of `.vimrc`:
```vim
" Auto-install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'           " already using
  Plug 'Yggdroot/indentLine'          " already using
  Plug 'tpope/vim-fugitive'           " git inside vim
  Plug 'tpope/vim-surround'           " cs"' to change surrounding quotes
  Plug 'tpope/vim-commentary'         " gcc to comment a line
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'             " :Files, :Rg, :GFiles inside vim
  Plug 'airblade/vim-gitgutter'       " git diff in the gutter
  Plug 'dense-analysis/ale'           " async linting
call plug#end()
```

### 3b. fzf.vim Bindings

```vim
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Rg<CR>
nnoremap <C-b> :Buffers<CR>
```

### 3c. Quality Settings to Add

```vim
set relativenumber     " relative line numbers — faster hjkl jumps
set cursorline         " highlight current line
set scrolloff=8        " keep 8 lines above/below cursor
set signcolumn=yes     " always show sign column (prevents layout shift)
set updatetime=100     " faster gitgutter updates
```

### 3d. Consider Neovim (Optional)

`brew install neovim` — drop-in compatible with your `.vimrc` via `init.vim`, but unlocks async plugins, Lua config, and better LSP support when you're ready to invest the time.

---

## 4. `Brewfile` — Package Cleanup & Additions

### 4a. Add

```ruby
brew "fzf"          # fuzzy finder — install, then run: $(brew --prefix)/opt/fzf/install
brew "ripgrep"      # fast grep (rg)
brew "fd"           # fast find
brew "eza"          # modern ls
brew "delta"        # beautiful git diffs
brew "zoxide"       # replaces autojump
brew "gh"           # GitHub CLI
brew "btop"         # system monitor
brew "dust"         # du replacement
brew "duf"          # df replacement
brew "glow"         # markdown in terminal
brew "httpie"       # better curl
brew "mise"         # replaces nvm + pyenv + pipenv with one tool
```

### 4b. Remove (Replaced)

```ruby
brew "autojump"     # replaced by zoxide
brew "travis"       # outdated, Travis CI largely defunct for OSS
```

### 4c. Consider Replacing nvm + pyenv + pipenv with mise

`mise` manages Node, Python, Ruby, Go, and more with a single tool and no shell hooks on startup:
```sh
mise use --global node@lts
mise use --global python@3.12
```

---

## 5. `VSCode settings.json` — Updates

### 5a. Fix Deprecated Shell Setting

`terminal.integrated.shell.osx` is deprecated. Replace with:
```json
"terminal.integrated.defaultProfile.osx": "zsh",
"terminal.integrated.profiles.osx": {
  "zsh": { "path": "/bin/zsh" }
},
```

### 5b. Upgrade Font

JetBrains Mono (already in kitty) is more consistent than mixing Fira Code:
```json
"editor.fontFamily": "JetBrainsMono Nerd Font, monospace",
"editor.fontSize": 14,
"editor.lineHeight": 1.6,
```

### 5c. Quality-of-Life Settings to Add

```json
"editor.bracketPairColorization.enabled": true,
"editor.guides.bracketPairs": "active",
"editor.stickyScroll.enabled": true,
"editor.inlayHints.enabled": "on",
"workbench.tree.indent": 16,
"explorer.fileNesting.enabled": true,
"explorer.fileNesting.patterns": {
  "*.ts": "${capture}.js, ${capture}.d.ts",
  "package.json": "package-lock.json, yarn.lock, .npmrc"
},
```

---

## Implementation Order

| Priority | Task | Effort | Impact |
|---|---|---|---|
| 1 | Lazy-load NVM, Conda, gcloud in `.zshrc` | Low | Immediate startup speedup |
| 2 | Install fzf + configure in `.zshrc` | Low | Transforms file/history navigation |
| 3 | Replace autojump with zoxide | Low | Drop-in, smarter cd |
| 4 | Add eza as ls + bat as cat | Low | Visual improvement + git-aware ls |
| 5 | Add delta for git diffs | Low | Run `git diff` and be amazed |
| 6 | Better history settings in `.zshrc` | Low | Permanent quality-of-life |
| 7 | Fix duplicate kitty binding + tab bar | Low | Polish |
| 8 | Fix VSCode deprecated shell setting | Low | Correctness |
| 9 | Add vim-plug + plugins to `.vimrc` | Medium | Big editor upgrade |
| 10 | Evaluate mise as nvm/pyenv replacement | Medium | Simplifies version management |
