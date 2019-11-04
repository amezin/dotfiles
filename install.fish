#!/usr/bin/env fish

set -l current_script (realpath (status -f))
set -l root_dir (realpath (dirname "$current_script"))

set bashrc_line "source '$root_dir/bashrc'"
if not grep -q "$bashrc_line" "$HOME/.bashrc"
  echo "$bashrc_line" >>"$HOME/.bashrc"
end

mkdir -p "$HOME/.config/fish/conf.d"
ln -sf "$root_dir/config.fish" "$HOME/.config/fish/conf.d/dotfiles.fish"

set -l gitconfig_link (readlink -f "$HOME/.gitconfig")
if test "$gitconfig_link" = "$root_dir/gitconfig"
  rm "$HOME/.gitconfig"
end

if not git config --global --get include.path "$root_dir/gitconfig" >/dev/null
  git config --global --add include.path "$root_dir/gitconfig"
end
