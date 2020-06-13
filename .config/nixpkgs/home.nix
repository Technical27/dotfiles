{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    libappindicator-gtk3
    gnomeExtensions.appindicator
    gnomeExtensions.caffeine
    gnomeExtensions.paperwm
    gnome3.gnome-tweaks
    pop-gtk-theme
    pop-icon-theme

    ripgrep
    rustup
    nerdfonts
    discord
    razergenie
    yadm
  ];

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      coc-nvim
      vim-airline
      vim-devicons
      fzf-vim
      vim-polyglot
      gruvbox
      undotree
      vim-fugitive
      vim-snippets
      vim-lastplace
      auto-pairs
    ];
    withNodeJs = true;
    withPython3 = true;
    extraConfig = import ./nvim.nix;
  };

  programs.fish.enable = true;
  programs.firefox.enable = true;
  programs.fzf.enable = true;
  programs.bat.enable = true;
  programs.htop.enable = true;
  programs.starship.enable = true;

  programs.kitty = with import ./kitty.nix; {
    enable = true;
    font = {
      name = "JetBrains Mono Regular Nerd Font Complete Mono";
    };
    inherit keybindings;
    inherit extraConfig;
  };
  programs.git = {
    enable = true;
    userName = "Aamaruvi Yogamani";
    userEmail = "38222826+Technical27@users.noreply.github.com";
    signing = {
      signByDefault = true;
      key = "F930CFBFF5D7FDC3";
    };
    extraConfig = {
      pull = { rebase = false; };
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage when a
  # new Home Manager release introduces backwards incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.03";
}
