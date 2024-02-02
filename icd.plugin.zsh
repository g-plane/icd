if command -v rg &> /dev/null; then
  ICD_GREP_TOOL=rg
  ICD_GREP_TOOL_OPTS="-xN"
else
  ICD_GREP_TOOL=grep
  ICD_GREP_TOOL_OPTS="-x"
fi

ICD_HISTORY_FILE="$HOME/.history.icd"

icd() {
  if [[ ! -f $ICD_HISTORY_FILE ]]; then
    touch $ICD_HISTORY_FILE
  fi

  if [[ $1 != "" ]]; then
    if [[ -d $1 ]]; then
      ICD_SELECTED=$(realpath $1)
    else
      ICD_SELECTED=$(cat $ICD_HISTORY_FILE | fzf --scheme=path --height=20% --layout=reverse --query $1)
    fi
  else
    ICD_SELECTED=$(cat $ICD_HISTORY_FILE | fzf --scheme=path --height=20% --layout=reverse)
  fi

  if [[ $ICD_SELECTED != "" ]]; then
    if [[ ! $ICD_SELECTED =~ ^/tmp && $($ICD_GREP_TOOL $ICD_GREP_TOOL_OPTS $ICD_SELECTED $ICD_HISTORY_FILE) != $ICD_SELECTED ]]; then
      echo $ICD_SELECTED >> $ICD_HISTORY_FILE
    fi
    builtin cd $ICD_SELECTED
  fi
}

alias cd="icd"
