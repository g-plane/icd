function icd
  if test "$ICD_GREP" = "grep"
    set -f grep_tool "grep"
    set -f grep_tool_opts "-x"
  else
    set -f grep_tool "rg"
    set -f grep_tool_opts "-xN"
  end

  set -f history_file "$HOME/.history.icd"
  if not test -f $history_file
    touch $history_file
  end

  if test -z $argv[1]
    set -f selected (cat $history_file | fzf --scheme=path --height=20% --layout=reverse)
  else
    if test -d $argv[1]
      set -f selected (realpath $argv[1])
    else
      set -f selected (cat $history_file | fzf --scheme=path --height=20% --layout=reverse --query $argv[1])
    end
  end

  if test -n $selected
    set -l searched ($grep_tool $grep_tool_opts $selected $history_file)
    if string match -v '/tmp*' $selected; and test "$searched" != $selected
      echo $selected >> $history_file
    end
    builtin cd $selected
  end
end
