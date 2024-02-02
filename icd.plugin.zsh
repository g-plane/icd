icd() {
  if [[ $ICD_GREP == "grep" ]]; then
    local grep_tool="grep"
    local grep_tool_opts="-x"
  else
    local grep_tool="rg"
    local grep_tool_opts="-xN"
  fi

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
    if [[ ! $selected =~ ^/tmp && $($grep_tool $grep_tool_opts $selected $history_file) != $selected ]]; then
      echo $selected >> $history_file
    fi
    builtin cd $selected
  fi
}

alias cd="icd"
