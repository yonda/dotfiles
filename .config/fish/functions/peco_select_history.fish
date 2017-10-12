function peco_select_history
  if test (count $argv) = 0
    set peco_flags --layout=bottom-up
  else
    set peco_flags --layout=bottom-up --query "$argv"
  end

  history|peco|read foo

  if [ $foo ]
    eval $foo
    commandline -f repaint
  else
    commandline ''
  end
end
