#!/usr/bin/env fish

set -l current_script (realpath (status -f))
set -l current_script_dir (realpath (dirname "$current_script"))

set -q XDG_CONFIG_HOME
    and set -l CONFIG_PATH "$XDG_CONFIG_HOME"
    or set -l CONFIG_PATH "$HOME/.config"

command mkdir -p "$CONFIG_PATH/fish"
command ln -sf "$current_script_dir/.config/fish/config.fish" "$CONFIG_PATH/fish/config.fish"
