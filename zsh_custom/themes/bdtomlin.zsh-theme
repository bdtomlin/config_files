grey="$FG[240]"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$grey%} ["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$grey%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{%F{red}%} ✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{%F{green}%} ✔"

function prompt_line1 {
  (( spare_width = ${COLUMNS} ))
  prompt=""

  branch=$(git_current_branch)
  prompt_path=${PWD/#$HOME/'~'}

  user_machine_size=${#${(%):-%n@%m-}}
  path_size=${#prompt_path}
  time_size=7

  if [[ ${#branch} -eq 0 ]]
    then (( git_info_size = 0 ))
  else
    (( git_info_size = ${#branch} + 5 ))
  fi
  
  (( spare_width = ${spare_width} - (${user_machine_size} + ${path_size} + ${git_info_size} + ${time_size} + 2) ))

  prompt="$FG[240]%~$(git_prompt_info) ${(l:$spare_width::—:):-} $prompt %T %n@%m"
  
  echo $prompt
}

setopt prompt_subst

local ret_status="%(?:%{$fg[yellow]%}▶ :%{$fg[red]%}▶ )"

precmd() { print -rP "$(prompt_line1)" }
PROMPT='${ret_status}%{$reset_color%}'


TRAPWINCH() {
  # this runs on window resize, may be useful for futurn tweaking
  # zle reset-prompt
  # reset && eval $(resize)
}
