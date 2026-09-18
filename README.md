# MyMacSetup

For installing and symlinking the tracked dotfiles (`.zshrc`, `.vimrc`, `kitty.conf`, VS Code settings) on a new machine, see [SETUP.md](SETUP.md) — that's the accurate, up-to-date quick-start. This README covers everything *outside* the dotfiles themselves: browser setup, GitHub access, and manual app installs not covered by `Brewfile`.

## Summary
- [**Chrome / Brave**](#chrome--brave)
- [**Firefox**](#firefox)
- [**VS Code**](#vs-code)
- [**Redis**](#redis)
- [**Heroku**](#heroku)
- [**Github SSH Configuration**](#github-ssh-configuration)
- [**Commonly Used NPM Packages**](#commonly-used-npm-packages)
- [**Other Applications**](#other-applications)
- [**Other Applications from Apple App Store**](#other-applications-from-apple-app-store)

***

## Chrome / Brave
- Click [here](https://www.google.com/chrome/?brand=CHBD&gclsrc=ds&gclsrc=ds) to Install _**Chrome**_
- Click [here](https://brave.com/download/) to Install _**Brave**_

### Extensions
1. [1Password](https://chrome.google.com/webstore/detail/1password-%E2%80%93-password-mana/aeblfdkhhhdcdjpifhhbdiojplfjncoa)
2. [Okta](https://chrome.google.com/webstore/detail/okta-browser-plugin/glnpjglilkicbckjpbgcfkogebgllemb)
3. [Octotree](https://chrome.google.com/webstore/detail/octotree-github-code-tree/bkhaagjahfmjljalopjnoealnfndnagc)
4. [React Dev Tool](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi)
5. [Redux Dev Tool](https://chrome.google.com/webstore/detail/redux-devtools/lmhkpmbekcpmknklioeibfkpmmfibljd)
6. [Daily.dev](https://chrome.google.com/webstore/detail/dailydev-the-homepage-dev/jlmpjdjjbgclbocgajdjefcidcncaied)

***

## Firefox
- Click [here](https://www.mozilla.org/en-US/firefox/new/) to Install _**Firefox**_

### Extensions
1. [1Password](https://1password.com/browsers/firefox/)
2. [Okta](https://addons.mozilla.org/en-US/firefox/addon/okta-browser-plugin/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search)
3. [Oktotree](https://addons.mozilla.org/en-US/firefox/addon/octotree/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search)

***

## VS Code
- Click [here](https://code.visualstudio.com/) to Install _**VS Code**_
- Extensions and settings are managed via this repo — see [`vscode-extensions.dump`](vscode-extensions.dump) for the extension list and [`VSCode - settings.json`](VSCode%20-%20settings.json) (symlinked in by `install.sh`) for the current settings/theme, rather than a hand-maintained list here.

***

## Redis
- Click [here](https://redis.io/download)
- Download the stable version available.
- Unzip the downloaded file and move to home directory
- run `make` command
- add required aliases

***

## Heroku
- Install _**heroku**_
  * Install using _**Home Brew**_ (already in `Brewfile`)
  ```
  brew tap heroku/brew && brew install heroku
  ```
  * Install _**Manually**_
  ```
  curl https://cli-assets.heroku.com/install.sh | sh
  ```
  * Install using _**NPM**_
  ```
  npm install -g heroku
  ```

***

## Github SSH configuration
- Create a directory .ssh in your home if it is not existing.
```
mkdir $HOME/.ssh
```
- Copy your Github email id (the email id provided by github)
- Generate your SSH key pair
```
ssh-keygen -t rsa -b 4096 -C <your@email.com>
```
- Verify `id_rsa` and `id_rsa.pub` are generated in .ssh directory
```
ls -al ~/.ssh
```
- Add your SSH key to ssh-agent
```
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```
- Copy your public SSH key
```
cat ~/.ssh/id_rsa.pub | pbcopy
```
- Add the public SSH key to github
- Test your authentication
```
ssh -T git@github.com
```
- Give necessary confirmation if it asks for
- [Reference](https://www.freecodecamp.org/news/git-ssh-how-to/)

***

## Commonly used npm packages
- [mocha](https://mochajs.org/)
- [nyc](https://github.com/istanbuljs/nyc)
- [nodemon](https://nodemon.io/)
- [knex](http://knexjs.org/)

Install `npm install -g <package name>`

***

## Other Applications

- [**Slack**](https://slack.com/intl/en-in/downloads/mac)
- [**PGAdmin**](https://www.pgadmin.org/download/pgadmin-4-macos/)
- [**Pycharm**](https://www.jetbrains.com/pycharm/download/#section=mac)
- [**Intellij**](https://www.jetbrains.com/idea/download/#section=mac)
- [**Ferdium**](https://ferdium.org/download)
- [**Obsidian**](https://obsidian.md/download)
- [**1Password**](https://1password.com/downloads/mac/)
- [**Zoom**](https://zoom.us/download)
- [**Evernote**](https://evernote.com/download)
- [**Node.js**](https://nodejs.org/en/download/)
- [**Postman**](https://www.postman.com/downloads/)
- [**DBeaver**](https://dbeaver.io/download/)
- [**Spotify**](https://www.spotify.com/us/download/mac/)
- [**XMind**](https://www.xmind.net/download/)
- [**VLC Player**](https://www.videolan.org/vlc/download-macosx.html)
- [**Google Drive for desktop**](https://www.google.com/drive/download/) (replaces the discontinued Backup and Sync)

***

## Other Applications from Apple App Store

- **Bandwidth+**
- **Todolist**
- **CopyClip**
- **iMovie**
