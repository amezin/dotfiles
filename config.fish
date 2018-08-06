set -x EDITOR nano
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

set -l current_script (realpath (status -f))
set -l root_dir (realpath (dirname "$current_script"))

function prepend_path
    for p in $argv
        if not contains "$p" $PATH; and test -d "$p"
            set PATH "$p" $PATH
        end
    end
end

prepend_path /usr/lib/ccache /usr/lib/ccache/bin /usr/local/opt/ccache/libexec
prepend_path "/Applications/Sublime Text.app/Contents/SharedSupport/bin"
prepend_path /home/linuxbrew/.linuxbrew/bin
prepend_path "$HOME/Library/Android/sdk/platform-tools"
prepend_path "/Applications/Wine Devel.app/Contents/Resources/wine/bin"

if command -v ruby >/dev/null
    prepend_path (ruby -rrubygems -e 'puts Gem.user_dir')/bin
end

prepend_path "$root_dir/pyenv/bin" "$root_dir"/pyenv/plugins/*/bin
prepend_path "$HOME/.local/bin"

if status --is-interactive
    source (pyenv init -|psub)
    eval (env "PYTHONPATH=$root_dir/virtualenv:$root_dir/virtualfish" python -m virtualfish auto_activation)
    set -g VIRTUALFISH_PYTHON_EXEC "env PYTHONPATH=$root_dir/virtualenv:$root_dir/virtualfish $VIRTUALFISH_PYTHON_EXEC"
end

set -g theme_powerline_fonts no
set -g theme_title_display_process yes
set -g theme_display_git_ahead_verbose yes
set -g theme_git_worktree_support yes
set -g theme_display_user yes
set -g theme_display_cmd_duration yes
set -g theme_show_exit_status yes

if not contains "$root_dir/theme-bobthefish" $fish_function_path
    set fish_function_path "$root_dir/theme-bobthefish" $fish_function_path
end

if not contains "$root_dir/theme-bobthefish/functions" $fish_function_path
    set fish_function_path "$root_dir/theme-bobthefish/functions" $fish_function_path
end

if set -q ITERM_SESSION_ID
    source "$root_dir/iterm2_shell_integration.fish"
end
