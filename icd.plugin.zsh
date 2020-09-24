if command -v fzy &> /dev/null; then
  ICD_FUZZ_TOOL=fzy
else
  ICD_FUZZ_TOOL=fzf
fi

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
      ICD_SELECTED=$1
    else
      ICD_SELECTED=$(cat $ICD_HISTORY_FILE | $ICD_FUZZ_TOOL -q $1)
    fi
  else
    ICD_SELECTED=$(cat $ICD_HISTORY_FILE | $ICD_FUZZ_TOOL)
  fi

  if [[ $ICD_SELECTED != "" ]]; then
    if [[ $($ICD_GREP_TOOL $ICD_GREP_TOOL_OPTS $ICD_SELECTED $ICD_HISTORY_FILE) != $ICD_SELECTED ]]; then
      echo $ICD_SELECTED >> $ICD_HISTORY_FILE
    fi
    builtin cd $ICD_SELECTED
  fi
}

alias cd="icd"
