set PATH /usr/local/bin /usr/sbin $HOME/bin $PATH
set PATH /usr/local/opt/mysql@5.6/bin $PATH
set PATH $HOME/.nodebrew/current/bin $PATH

set PGDATA /usr/local/var/postgres
set -Ux EDITOR vim

# go
set GOPATH $HOME/.go
set PATH $HOME/.go/bin $PATH

set ACCESS_KEY_ID AKIAIAU62E7KBJ5PGJXA
set SECRET_ACCESS_KEY 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
set USE_SIGNED_URI false
set DOMAIN_NAME esm_eight_gees_dev

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
balias br 'bundle exec rspec'
balias gl 'git lo'
balias gh 'git hf'
balias e 'peco_select_ghq_repository'
balias s 'peco_ssh'
balias testssh 'ssh honda@quality_test -L 2001:gees-production-test-op104.clbkbh397jyy.ap-northeast-1.rds.amazonaws.com:3306'
balias ssh '~/bin/ssh-change-profile.sh'

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
set -gx DOCKER_TLS_VERIFY "1";
set -gx DOCKER_HOST "tcp://192.168.99.100:2376";
set -gx DOCKER_CERT_PATH "/Users/honda/.docker/machine/machines/dev";
set -gx DOCKER_MACHINE_NAME "dev";
# Run this command to configure your shell: 
# eval (docker-machine env dev)
