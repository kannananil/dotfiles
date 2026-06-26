# Dotfiles Setup

## First-time setup on a new machine

### 1. Install Homebrew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Clone this repo

```sh
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
```

### 3. Install all packages

```sh
brew bundle --file=~/dotfiles/Brewfile
```

### 4. Symlink config files

```sh
chmod +x ~/dotfiles/install.sh
~/dotfiles/install.sh
```

This creates symlinks like `~/.zshrc → ~/dotfiles/.zshrc`. Any existing files are backed up to `~/.dotfiles-backup-<timestamp>/` before being replaced.

### 5. Post-install steps

**fzf key bindings** (run once after installing fzf):
```sh
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc
```

**Oh My Zsh** (if not installed):
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

**Oh My Zsh plugins** (zsh-syntax-highlighting + zsh-autosuggestions):
```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

**Powerlevel10k theme**:
```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# Then run: p10k configure
```

### 6. Apply changes

```sh
source ~/.zshrc
```

---

## How symlinking works

`install.sh` creates a symlink in the standard location pointing back to the file in this repo:

```
~/.zshrc  →  ~/dotfiles/.zshrc
~/.vimrc  →  ~/dotfiles/.vimrc
~/Library/Application Support/Code/User/settings.json  →  ~/dotfiles/VSCode - settings.json
```

**To edit a config:** open the file in `~/dotfiles/` — both paths point to the same file.  
**To track changes:** `cd ~/dotfiles && git diff` shows everything.  
**To update a machine:** `git pull` inside `~/dotfiles/` — changes are live immediately since the symlink always reads the current file.

---

## Adding a new config file to dotfiles

1. Move the file into `~/dotfiles/`:
   ```sh
   mv ~/.someconfig ~/dotfiles/.someconfig
   ```
2. Add a `link` line to `install.sh`:
   ```sh
   link ".someconfig" ".someconfig"
   ```
3. Run `install.sh` again to create the symlink.
4. Commit and push.
