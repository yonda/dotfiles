set PATH /usr/local/bin /usr/sbin $PATH
set PATH /usr/local/opt/mysql@5.6/bin $PATH

set PGDATA /usr/local/var/postgres

# go
set GOPATH $HOME/.go
set PATH $HOME/.go/bin $PATH

function fish_user_key_bindings
  bind \cr peco_select_history # Bind for peco select history to Ctrl+r
end

balias g  'git'
balias ls 'ls -FG'
balias la 'ls -al'
balias b  'bundle'
balias bo 'bundle open'
balias bc 'bundle console'
balias be 'bundle exec'
balias bi 'bundle install'
balias bo 'bundle open'
balias bu 'bundle update'
balias gl 'git lo'
balias gh 'git hf'
balias e 'peco_select_ghq_repository'
balias s 'peco_ssh'

# Fish git prompt
# set __fish_git_prompt_showdirtystate 'yes'
# set __fish_git_prompt_showstashstate 'yes'
# set __fish_git_prompt_showuntrackedfiles 'yes'
# set __fish_git_prompt_showupstream 'yes'

# set __fish_git_prompt_color_branch yellow
# set __fish_git_prompt_color_upstream_ahead green
# set __fish_git_prompt_color_upstream_behind red

# Status Chars
# set __fish_git_prompt_char_dirtystate '⚡'
# set __fish_git_prompt_char_stagedstate '→'
# set __fish_git_prompt_char_untrackedfiles 'N'
# set __fish_git_prompt_char_stashstate '↩'
# set __fish_git_prompt_char_upstream_ahead '+'
# set __fish_git_prompt_char_upstream_behind '-'

complete -c ssh -e
