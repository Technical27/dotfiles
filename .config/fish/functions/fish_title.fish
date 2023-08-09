set -q argv[1]; or set argv fish
set -l realhome ~
set -l dir (string replace -r '^'"$realhome"'($|/)' '~$1' $PWD)
echo "$dir: $argv"
