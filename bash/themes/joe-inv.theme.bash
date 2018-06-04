#!/usr/bin/env bash

resetColor="${normal}"
prefix="$"
dir="${bold_black}\W${resetColor}"

case $TERM in
	xterm*)
	TITLEBAR="\[\033]0;\w\007\]"
	;;
	*)
	TITLEBAR=""
	;;
esac

function prompt_command() {
	PS1="${TITLEBAR}${prefix} ${dir} $(scm_prompt_info)"
}

SCM_GIT_SHOW_MINIMAL_INFO=true
SCM_THEME_PROMPT_PREFIX="at ${bold_black}"
SCM_THEME_PROMPT_SUFFIX="${resetColor} "
SCM_THEME_PROMPT_DIRTY="${bold_red} ✖"
SCM_THEME_PROMPT_CLEAN="${bold_green} ✔"

safe_append_prompt_command prompt_command
