set -l current_script (realpath (status -f))
set -l current_script_dir (realpath (dirname "$current_script"))
set -l root_dir (realpath "$current_script_dir/../..")

set -gx OMF_PATH (realpath "$root_dir/oh-my-fish")
set -gx OMF_CONFIG (realpath "$root_dir/config/omf")

source $OMF_PATH/init.fish
