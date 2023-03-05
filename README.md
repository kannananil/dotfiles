# MyMacSetup

## Summary
- [**Chrome / Brave**](#chrome--brave)
- [**Firefox**](#firefox)
- [**Home Brew**](#home-brew)
- [**Iterm**](#iterm)
- [**Zsh**](#zsh)
- [**Oh My Zsh**](#oh-my-zsh)
- [**Powerlevel10k**](#powerlevel10k)
- [**Zsh Auto Suggestion**](#zsh-auto-suggestion)
- [**Zsh Syntax Highlighting**](#zsh-syntax-highlighting)
- [**Vim**](#vim)
- [**VS Code**](#vs-code)
- [**Alacritty**](#alacritty)
- [**fish**](#fish)
- [**tmux**](#tmux)
- [**Redis**](#redis)
- [**Heroku**](#heroku)
- [**Travis**](#travis)
- [**bat**](#bat)
- [**jq**](#jq)
- [**tree**](#tree)
- [**Auto Jump**](#autojump)
- [**Pyenv**](#pyenv)
- [**ShiftIt**](#shiftit)
- [**Github SSH Configuration**](#github-ssh-configuration)
- [**Commonly Used NPM Packages**](#commonly-used-npm-packages)
- [**Other Applications**](#other-applications)
- [**Other Applications from Apple App Store**](#other-applications-from-apple-app-store)

***


## Chrome / Brave
- Click [here](https://www.google.com/chrome/?brand=CHBD&gclsrc=ds&gclsrc=ds) to Install _**Chrome**_
- Click [here](https://brave.com/download/) to Install _**Brave**_

### Extensions   
1. [1Password Old](https://chrome.google.com/webstore/detail/1password-extension-deskt/aomjjhallfgjeglblehebfpbcfeobpgk)
1. [1Password New](https://chrome.google.com/webstore/detail/1password-%E2%80%93-password-mana/aeblfdkhhhdcdjpifhhbdiojplfjncoa)
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
 
 ## Home Brew
- Install _**Home Brew**_
by running this scipt on the terminal ([Reference](https://brew.sh/))
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```
 
***
 
 ## Iterm
 - Click [here](https://www.iterm2.com/downloads.html) to Install _**Iterm2**_
 
***
 
 ## Zsh
  - Install _**zsh**_
  ```
  brew install zsh
  ```
  - Make _**zsh**_ as *default shell*
  ```
  chsh -s /usr/local/bin/zsh
  ```
  - Get .zshrc file [here](https://github.com/charliechaplinn/MyMacSetup/blob/main/.zshrc)
  - Add this file as ```~/.zshrc```
  
   [(Reference)](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
  
***
  
 ## Oh My Zsh
  - Install _**ohmyzsh**_
  ```
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```
  
   [(Reference)](https://github.com/ohmyzsh/ohmyzsh)
  
***

 ## Powerlevel10k
 - Install _**Powerlevel10k**_
    * Install _**Manually**_
    ```
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
    echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
    ```
    _**OR**_
    
    * Using _**ohmyzsh**_
    ```
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    ```
    _**OR**_
    * Using _**Home Brew**_
    ```
    brew install romkatv/powerlevel10k/powerlevel10k
    echo 'source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
    ```
 - Configure _**Powerlevel10k**_
 ```
 p10k cofigure
 ```
 
  [(Reference)](https://github.com/romkatv/powerlevel10k#oh-my-zsh)
 
 ***
 
 ## Zsh Auto Suggestion
 - Install _**zsh Auto suggestion**_ [(Reference)](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
    * Install _**Mannually**_
    ```
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
    ```
    then add the following to your .zshrc
    ```
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    ```
    _**OR**_
    
    * Using _**oh my zsh**_
    ```
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    ```
    then add the following to your .zshrc
    ```
    plugins=(zsh-autosuggestions)
    ```

***

## Zsh Syntax Highlighting
- Install _**zsh syntax highlighting**_ [(Reference)](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)
    * Install _**Mannually**_
    ```
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
    echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
    ```
    _**OR**_
    
    * Using _**oh my zsh**_
    ```
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    ```
    then add the following to your .zshrc
    ```
    plugins=(zsh-syntax-highlighting)
    ```
***

## Vim
- Get vim configuration file [here](https://github.com/charliechaplinn/MyMacSetup/blob/main/.vimrc)
- Add this file as ```~/.vimrc```

***
    
## VS Code
- Click [here](https://code.visualstudio.com/) to Install _**VS Code**_
  ### Extensions
  - Code Spell Checker
  - ES Lint
  - Git History
  - Git Lens
  - Prettier
  - C/C++
  - Quokka.js
  - SQLite
  
  ### Theme
  - Molokai (Dark)
  
***

## Alacritty 
  - Install _**Mannually**_ [(Reference)](https://github.com/alacritty/alacritty/blob/master/INSTALL.md)

  _**OR**_

  ```
  brew cask install alacritty
  ```
  - Get configured alacritty.yml file [here](https://github.com/charliechaplinn/MyMacSetup/blob/main/alacritty.yml)
  - Add this file as ```~/.config/alacritty/alacritty.yml```
  
***
  
## fish
  
  - Install _**Fish**_ [(Reference)](https://fishshell.com/)
  ```
  brew install fish
  ```
  - Get fish cofiguration file [here](https://github.com/charliechaplinn/MyMacSetup/tree/main)
  - Add this file in ```~/.config/fish/config.fish```
  
***

## tmux  
  - Install _**tmux**_ [(Reference)](https://github.com/tmux/tmux/wiki/Installing)
  ```
  brew install tmux
  ```
  - Get tmux configuration file [here](https://github.com/charliechaplinn/MyMacSetup/blob/main/tmux.conf)
  - Add this file as ```~/.tmux.conf```
  
***

## Redis
 - Click [here](https://redis.io/download)
 - Download the stable version available.
 - Unzip the downloaded file and move to home directory
 - run ```make``` command
 - add required aliases

***

## Heroku
 - Install _**heroku**_
  * Install using _**Home Brew**_
  ```
  brew tap heroku/brew && brew install heroku
  ````
  * Install _**Manually**_
  ```
  curl https://cli-assets.heroku.com/install.sh | sh
  ```
  * Install using _**NPM**_
  ```
  npm install -g heroku
  ```

***

## travis
 - Install _**travis**_
 ```
 brew install travis
 ```
 Gighub [reference](https://github.com/travis-ci/travis.rb/#mac-os-x-via-homebrew)
 
***

## bat
 - bat is similar to cat command but have syntax highlighting also.
 - Install _**bat command**_ 
 ```
 brew install bat
 ```
 
 ***
 
## jq
 - _**jq**_ is a lightweight and flexible command-line JSON processor.
 - Install _**jq**_
 ```
 brew install jq
 ```
 - Refer this [tutorial](https://stedolan.github.io/jq/tutorial/)
 
 ***
 
 ## tree
  - _**tree**_ command used to display the directory structure
  - Install _**tree**_
  ```
  brew install tree
  ```
 
 ***

 ## Autojump
  - A cd command that learns - easily navigate directories from the command line
  - Install _**AutoJump**_ [(Reference)](https://github.com/wting/autojump)
  ```
  brew install autojump
  ```
  then add the following line into your .zshrc
  ```
  [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
  ```

***

 ## Pyenv
  - Pyenv lets you easily switch between multiple versions of Python.
  - Install _**Pyenv**_ [(Reference)](https://github.com/pyenv/pyenv#installation)
  ```
  brew install pyenv
  ```
  then add the following lines into your .zshrc
  ```
  export PYENV_ROOT="$HOME/.pyenv"
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  ```

***

 ## NVM
  - nvm allows you to quickly install and use different versions of node via the command line.
  - Install _**NVM**_ [(Reference)](https://github.com/nvm-sh/nvm#installing-and-updating)
  ```
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
  ```
  then add the following lines into your .zshrc
  ```
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  ```

***

## ShiftIt
  - Install _**ShiftIt**_ [(Reference)](https://github.com/fikovnik/ShiftIt)
  ```
  brew install shiftit
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
- Verify ```id_rsa``` and ```id_rsa.pub``` are generated in .ssh directory
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
- Add the publich SSH key to github
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
 
 Install ```npm install -g <package name>``` 
 
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
- [**Google Backup**](https://www.google.com/intl/en-GB_ALL/drive/download/backup-and-sync/)

****

## Other Applications from Apple App Store

- **Bandwidth+**
- **Todolist**
- **CopyClip**
- **Imovie**
