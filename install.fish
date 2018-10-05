#!/usr/bin/env fish

set -l current_script (realpath (status -f))
set -l root_dir (realpath (dirname "$current_script"))

set bashrc_line "source '$root_dir/bashrc'"
if not grep -q "$bashrc_line" "$HOME/.bashrc"
  echo "$bashrc_line" >>"$HOME/.bashrc"
end

mkdir -p "$HOME/.config/fish/conf.d"
ln -sf "$root_dir/config.fish" "$HOME/.config/fish/conf.d/dotfiles.fish"

ln -sf "$root_dir/gitconfig" "$HOME/.gitconfig"
