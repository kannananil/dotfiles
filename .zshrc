# Enable Powerlevel10k instant prompt. Must stay at the top.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ── Oh My Zsh ─────────────────────────────────────────────────────────────────
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# ── Editors ───────────────────────────────────────────────────────────────────
export EDITOR='vim'
export VISUAL='code'

# ── History ───────────────────────────────────────────────────────────────────
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE   # prefix a command with space to keep it out of history
setopt HIST_VERIFY
setopt SHARE_HISTORY

# ── Shell options ─────────────────────────────────────────────────────────────
setopt AUTO_CD
setopt NO_BEEP
setopt CORRECT

# ── PATH ──────────────────────────────────────────────────────────────────────
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/bin:$HOME/bin/__goData:$HOME/bin/jsn"
export ANDROID_SDK="$HOME/Library/Android/sdk"
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
export NEO_FOLDER="$HOME/projects/goData/neo/"
export HOMEBREW_NO_AUTO_UPDATE=1

# ── Key bindings ──────────────────────────────────────────────────────────────
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

# ── Navigation ────────────────────────────────────────────────────────────────
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ── ls → eza ──────────────────────────────────────────────────────────────────
alias ls='eza --icons --group-directories-first'
alias ll='eza -la --icons --git --group-directories-first'
alias lt='eza --tree --level=2 --icons'
alias ltt='eza --tree --level=3 --icons'

# ── Modern CLI replacements ───────────────────────────────────────────────────
alias cat='bat'
alias grep='rg'
alias find='fd'
alias du='dust'
alias df='duf'
alias top='btop'

# ── Git ───────────────────────────────────────────────────────────────────────
alias gap='git add -p'
alias gsh='git stash'
alias gshp='git stash -p -m'
alias gshl='git stash list'
alias gsha='git stash apply'
alias glog='git log --oneline --decorate --graph --all'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gri='git rebase -i'
alias gcp='git cherry-pick'
alias grs='git restore --staged'
alias gundo='git reset --soft HEAD~1'

# ── Apps ──────────────────────────────────────────────────────────────────────
alias pycharm="open -a 'PyCharm CE'"
alias ultimate="open -a 'IntelliJ IDEA'"
alias intellij="open -a 'IntelliJ IDEA CE'"
alias pgsql='pg_ctl -D /usr/local/var/postgres'
alias jmeter="$HOME/Library/apache-jmeter/bin/jmeter.sh"

# ── Terraform ─────────────────────────────────────────────────────────────────
alias tfinit='terraform init -input=false'
alias tfplan='terraform plan -out tfapply -var-file=variables.tfvars'
alias tfapply='terraform apply -auto-approve tfapply'

# ── Utilities ─────────────────────────────────────────────────────────────────
alias npmi='npm i --also=dev'
alias myip='curl -s https://ipecho.net/plain; echo'
alias path='echo $PATH | tr ":" "\n"'
alias reload='source ~/.zshrc'

function chmodx() {
  chmod +x $1
}

# ── zoxide (replaces autojump) ────────────────────────────────────────────────
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
  alias cd='z'
fi

# ── fzf ───────────────────────────────────────────────────────────────────────
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --preview "bat --color=always {}"'
export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'

# ── Lazy-load NVM (~300-500ms startup savings) ────────────────────────────────
export NVM_DIR="$HOME/.nvm"
nvm() {
  unfunction nvm node npm npx
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
  nvm "$@"
}
node() { nvm use default --silent; node "$@" }
npm()  { nvm use default --silent; npm "$@" }
npx()  { nvm use default --silent; npx "$@" }

# ── Lazy-load Conda (~200ms startup savings) ──────────────────────────────────
conda() {
  unfunction conda
  __conda_setup="$("$HOME/opt/anaconda3/bin/conda" 'shell.zsh' 'hook' 2>/dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  else
    if [ -f "$HOME/opt/anaconda3/etc/profile.d/conda.sh" ]; then
      . "$HOME/opt/anaconda3/etc/profile.d/conda.sh"
    else
      export PATH="$HOME/opt/anaconda3/bin:$PATH"
    fi
  fi
  unset __conda_setup
  conda "$@"
}

# ── Lazy-load gcloud (~100ms startup savings) ─────────────────────────────────
gcloud() {
  unfunction gcloud
  [ -f "$HOME/bin/google-cloud-sdk/path.zsh.inc" ] && . "$HOME/bin/google-cloud-sdk/path.zsh.inc"
  [ -f "$HOME/bin/google-cloud-sdk/completion.zsh.inc" ] && . "$HOME/bin/google-cloud-sdk/completion.zsh.inc"
  gcloud "$@"
}

# ── Completions ───────────────────────────────────────────────────────────────
fpath+=${ZDOTDIR:-~}/.zsh_functions
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

# ── Powerlevel10k ─────────────────────────────────────────────────────────────
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
