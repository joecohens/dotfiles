# Based on zeit zsh theme
local resetColor="%{$reset_color%}"
local prefix="#"
local dir="%{$fg_bold[black]%}%c$resetColor$resetColor"

PROMPT='$prefix $dir $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="at %{$fg_bold[black]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$resetColor "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%} ✖"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} ✔"
