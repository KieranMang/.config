# Launch picker for tmux sessions if launching shell
# and not already in tmux

function fzf_tmux
    set sessions (tmux ls 2>/dev/null)
    set session (begin
        if test -n "$sessions"
            printf '%s\n' $sessions
        end
        echo "New Session"
    end | fzf --height 40% --layout=reverse --border --prompt="Tmux> ")
    
    if test -z "$session"
        return
    end
    
    if test "$session" = "New Session"
        tmux new
    else
        set session_name (string split ":" "$session")[1]
        tmux attach -t "$session_name"
    end
end

if test -z "$TMUX"
    fzf_tmux
end


fastfetch



fish_vi_key_bindings

# disable "welcome to fish" message
set fish_greeting ""
set -x EDITOR "nvim"
set -x BAT_THEME "gruvbox-dark"
set -x TERM "xterm-256color"
set -x LANG "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"

bind -M insert ctrl-y accept-autosuggestion
set fish_color_autosuggestion "#504945"

abbr --add vim nvim
abbr --add nv nvim

abbr --add .. cd ..
abbr --add .... cd ../..
abbr --add ...... cd ../../..
abbr --add ........ cd ../../../..
abbr --add .......... cd ../../../../..
abbr --add ............ cd ../../../../../..
abbr --add .............. cd ../../../../../../..

abbr --add ls "eza"
abbr --add la "eza -la"
abbr --add lstr "eza --tree"

abbr --add reload "source ~/.config/fish/config.fish"



zoxide init fish | source
alias cd="z"
alias cdi="zi"

starship init fish | source

function pyenv
    functions --erase pyenv
    pyenv init - fish | source

    if status --is-interactive
        pyenv virtualenv-init - | source
    end

    pyenv $argv
end

function python --wraps=python
    set python_path (command -v python)

    if not string match -q "*pyenv*" -- $python_path
        pyenv
        printf "\n\n\033[1;4mPYTHON OUTPUT:\033[0m\n\n"
    end

    command python $argv
end

function pip --wraps=pip
    set pip_path (command -v pip)

    if not string match -q "*pyenv*" -- $pip_path
        pyenv
        printf "\n\n\033[1;4mPYTHON OUTPUT:\033[0m\n\n"
    end

    command pip $argv
end


function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

#Lazyload conda for faster startup

set -x CONDA_PATH /opt/miniconda3/condabin/conda

function conda
    echo "Lazy loading conda upon first invocation..."
    functions --erase conda
    for conda_path in $CONDA_PATH
        if test -f $conda_path
            echo "Using Conda installation found in $conda_path"
            eval $conda_path "shell.fish" "hook" | source
            conda $argv
            return
        end
    end
    echo "No conda installation found in $CONDA_PATH"
end

fish_add_path /Users/kieranmang/.spicetify
