set -l current_script (realpath (status -f))
set -l current_script_dir (realpath (dirname "$current_script"))
set -l root_dir (realpath "$current_script_dir/../..")

set -x PYTHONPATH (string join ":" "$PYTHONPATH" "$root_dir/virtualenv" "$root_dir/virtualfish")

set -g theme_powerline_fonts no
set -g theme_title_display_process yes
set -g theme_display_git_ahead_verbose yes
set -g theme_git_worktree_support yes
set -g theme_display_user yes
set -g theme_display_cmd_duration yes
set -g theme_show_exit_status yes

set -g VIRTUALFISH_PLUGINS auto_activation
