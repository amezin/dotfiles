set -gx EDITOR nano

if test -d "/Applications/Sublime Text.app/Contents/SharedSupport/bin"
    set PATH $PATH "/Applications/Sublime Text.app/Contents/SharedSupport/bin"
end

set -l current_script (realpath (status -f))
set -l current_script_dir (realpath (dirname "$current_script"))
set -l root_dir (realpath "$current_script_dir/../..")

set -x PYTHONPATH (string join ":" "$PYTHONPATH" "$root_dir/virtualenv" "$root_dir/virtualfish")
eval (python -m virtualfish auto_activation)

set PATH $PATH "$root_dir/pyenv/bin" $root_dir/pyenv/plugins/*/bin
status --is-interactive; and source (pyenv init -|psub)

set -g theme_powerline_fonts no
set -g theme_title_display_process yes
set -g theme_display_git_ahead_verbose yes
set -g theme_git_worktree_support yes
set -g theme_display_user yes
set -g theme_display_cmd_duration yes
set -g theme_show_exit_status yes

for theme_func in "$root_dir/theme-bobthefish"/*.fish
    source "$theme_func"
end

if set -q ITERM_SESSION_ID
    source "$root_dir/iterm2_shell_integration.fish"
end

set VIRTUAL_ENV_DISABLE_PROMPT 1
