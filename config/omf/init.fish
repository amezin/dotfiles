set -l current_script (realpath (status -f))
set -l current_script_dir (realpath (dirname "$current_script"))
set -l root_dir (realpath "$current_script_dir/../..")

set PATH $PATH "$root_dir/pyenv/bin" $root_dir/pyenv/plugins/*/bin

status --is-interactive; and source (pyenv init -|psub)

set -gx EDITOR nano

if test -d "/Applications/Sublime Text.app/Contents/SharedSupport/bin"
    set PATH $PATH "/Applications/Sublime Text.app/Contents/SharedSupport/bin"
end
