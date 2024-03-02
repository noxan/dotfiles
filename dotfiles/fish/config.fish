set fish_greeting

if status is-interactive
  starship init fish | source
end

set pure_symbol_prompt "\$"

set -U fish_user_paths /opt/homebrew/bin/ $fish_user_paths

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export EDITOR=nvim

abbr -a s "cd $HOME/workspace"
abbr -a vi "nvim"
abbr -a vim "nvim"
abbr -a g "git"
