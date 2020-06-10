set fish_user_paths $HOME/.cargo/bin $fish_user_paths

function mkcd -d "create a directory and cd into it"
  mkdir $argv[1]
  if test $status = 0
    cd $argv[1]
  end
end

starship init fish | source
