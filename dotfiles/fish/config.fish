set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
end

set pure_symbol_prompt "\$"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Base16 Shell
# if status --is-interactive
#   eval sh $HOME/.config/base16-shell/scripts/base16-oceanicnext.sh
# end

export EDITOR=nvim

abbr -a s "cd $HOME/workspace"

abbr -a vi "nvim"
abbr -a vim "nvim"

abbr -a g "git"

# abbr -a code "code-insiders"

# Flutter
export PATH="$HOME/workspace/flutter/bin:$PATH"

# Android
# export ANDROID_HOME="$HOME/Library/Android/sdk"
# export PATH="$PATH:$ANDROID_HOME/tools"
# export PATH="$PATH:$ANDROID_HOME/platform-tools"

# Rust / cargo
# export PATH="$HOME/.cargo/bin:$PATH"
