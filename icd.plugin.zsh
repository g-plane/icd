if command -v rg &> /dev/null; then
  ICD_GREP_TOOL=rg
  ICD_GREP_TOOL_OPTS="-xN"
else
  ICD_GREP_TOOL=grep
  ICD_GREP_TOOL_OPTS="-x"
fi

icd() {
  local history_file="$HOME/.history.icd"
  if [[ ! -f $history_file ]]; then
    touch $history_file
  fi

  if [[ $1 != "" ]]; then
    if [[ -d $1 ]]; then
      local selected=$(realpath $1)
    else
      local selected=$(cat $history_file | fzf --scheme=path --height=20% --layout=reverse --query $1)
    fi
  else
    local selected=$(cat $history_file | fzf --scheme=path --height=20% --layout=reverse)
  fi

  if [[ $selected != "" ]]; then
    if [[ ! $selected =~ ^/tmp && $($ICD_GREP_TOOL $ICD_GREP_TOOL_OPTS $selected $history_file) != $selected ]]; then
      echo $selected >> $history_file
    fi
    builtin cd $selected
  fi
}

alias cd="icd"
