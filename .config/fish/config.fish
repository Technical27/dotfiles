if status is-interactive
    # if test -z "$WAYLAND_DISPLAY"; and test (tty) = "/dev/tty1"
        # eval "$(cat ~/.config/user-dirs.dirs | sed -E 's/^(XDG.*)/export \1/')"
        # exec sway
    # end

    set -g fish_color_autosuggestion '555'  'brblack'
    set -g fish_color_cancel -r
    set -g fish_color_command --bold
    set -g fish_color_comment 'brblack'
    set -g fish_color_cwd green
    set -g fish_color_cwd_root red
    set -g fish_color_end brmagenta
    set -g fish_color_error brred
    set -g fish_color_escape 'bryellow'  '--bold'
    set -g fish_color_history_current --bold
    set -g fish_color_host normal
    set -g fish_color_match --background=brblue
    set -g fish_color_normal normal
    set -g fish_color_operator bryellow
    set -g fish_color_param cyan
    set -g fish_color_quote yellow
    set -g fish_color_redirection brblue
    set -g fish_color_search_match 'bryellow'  '--background=brblack'
    set -g fish_color_selection 'white' '--bold'  '--background=brblack'
    set -g fish_color_user brgreen
    set -g fish_color_valid_path --underline
    set -ag fish_user_paths "$HOME/.local/bin"

    set -g fish_cursor_insert line
    set -g fish_cursor_default block
    fish_vi_key_bindings

    alias make="make -j8"
    alias icat="kitty +kitten icat"
    alias cat="bat"
    alias grep="rg"
    alias ls="exa --git --icons"
    alias tree="exa --git --icons --tree"

    starship init fish | source
end
