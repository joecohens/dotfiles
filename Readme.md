# Dotfiles

Configuration for zsh, bash and vim using oh-my-zsh.

## Instalation

- Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
- Install [bash-it](https://github.com/Bash-it/bash-it)
- Install (optional) [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- Configure .dotfiles:

```bash
git clone git@github.com:joecohens/dotfiles.git
```

### Zsh

```bash
echo "source ~/.dotfiles/zshrc" >> ~/.zshrc
mkdir ~/.oh-my-zsh/custom/themes
ln -s ~/.dotfiles/zsh/themes/joe.zsh-theme ~/.oh-my-zsh/custom/themes/joe.zsh-theme
plugins=(git git-extras brew npm sublime composer zsh-autosuggestions)
```

### Bash

```bash
echo "source ~/.dotfiles/bashrc" >> ~/.bashrc
mkdir -p ~/.bash_it/custom/themes/joe
ln -s ~/.dotfiles/bash/themes/joe.theme.bash ~/.bash_it/custom/themes/joe/joe.theme.bash
bash-it enable plugin git
bash-it enable alias git homebrew npm
bash-it enable completion git brew composer npm
```

### Vim

```bash
ln -s ~/.dotfiles/vimrc ~/.vimrc
```

### Extras

```bash
ln -s ~/.dotfiles/gitignore ~/.global_gitignore
ln -s ~/.dotfiles/agignore ~/.agignore
```