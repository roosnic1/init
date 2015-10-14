init
====

Configfiles, Tools, System Hacks, Colors and all that stuff


# Requirements
## Powerline
```sh
pip install --user powerline-status
```

## Powerline Fonts
```sh
git clone git@github.com:powerline/fonts.git
cd fonts
./install.sh
```


# Iterm

change Regular and Non-ASCII Font to:
12pt Meslo LG S DZ Regular for Powerline

change theme to Tomorrow Night Bright


# Install zsh
```sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## Install zsh Theme
https://github.com/caiogondim/bullet-train-oh-my-zsh-theme/blob/master/bullet-train.zsh-theme

# Install thefuck
https://github.com/nvbn/thefuck

# Install z
https://github.com/rupa/z

# Configure launchctl for mongodb
add plist to ~/Library/LaunchAgents/org.mongodb.mongod.plist
```sh
launchctl load ~/Library/LaunchAgents/org.mongodb.mongod.plist
launchctl start org.mongodb.mongod
```
