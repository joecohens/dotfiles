# Dotfiles

Dotfiles for easy MacOS setup.

## Setup

```bash
git clone git@github.com:joecohens/dotfiles.git .dotfiles
```

### zsh

Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

```bash
echo "source ~/.dotfiles/zshrc" >> ~/.zshrc
# If needed create the theam folder first, it might be already created for you.
mkdir ~/.oh-my-zsh/custom/themes

# Install oh-my-zsh custom themes
ln -s ~/.dotfiles/zsh/themes/joe.zsh-theme ~/.oh-my-zsh/custom/themes/joe.zsh-theme
# and/or
ln -s ~/.dotfiles/zsh/themes/joe-inv.zsh-theme ~/.oh-my-zsh/custom/themes/joe-inv.zsh-theme

plugins=(
  brew
  composer
  kubectl
  git
  git-extras
  npm
  zsh-autosuggestions
)
```

### Bash

Install [bash-it](https://github.com/Bash-it/bash-it)

```bash
echo "source ~/.dotfiles/bashrc" >> ~/.bashrc

# Install bash custom themes
mkdir -p ~/.bash_it/custom/themes/joe
ln -s ~/.dotfiles/bash/themes/joe.theme.bash ~/.bash_it/custom/themes/joe/joe.theme.bash
# and/or
mkdir -p ~/.bash_it/custom/themes/joe-inv
ln -s ~/.dotfiles/bash/themes/joe-inv.theme.bash ~/.bash_it/custom/themes/joe-inv/joe-inv.theme.bash

bash-it enable plugin git
bash-it enable alias git homebrew npm
bash-it enable completion git brew composer npm
```

### Vim or NeoVim

Install [Vundle](https://github.com/VundleVim/Vundle.vim)

#### Vim

```bash
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc
:VundleInstall
```

#### NeoVim

```bash
ln -s ~/.dotfiles/vimrc ~/.config/nvim/init.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc
:VundleInstall
```

### tmux

Install [tpm](https://github.com/tmux-plugins/tpm)

```bash
ln -s ~/.dotfiles/tmux ~/.tmux.conf
prefix + I
```

### Homebrew

Install [Homebrew](https://brew.sh)

```bash
cd ~/.dotfiles
brew bundle
```

### Extras

Install (optional) [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

```bash
ln -s ~/.dotfiles/gitignore ~/.gitignore_global
ln -s ~/.dotfiles/agignore ~/.agignore
```
