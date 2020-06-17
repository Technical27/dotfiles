[
  (self: super: {
    openrgb = with import <nixpkgs> {}; super.callPackage /home/aamaruvi/pkgs/openrgb.nix {};
  })
  (self: super: {
    pop-shell = with import <nixpkgs> {}; super.callPackage /home/aamaruvi/pkgs/pop.nix {};
  })
  # discord is broken for now, but the issue is fixed in master
  (self: super: { discord = super.discord.overrideAttrs (old: rec {
    nativeBuildInputs = old.nativeBuildInputs ++ [ super.libuuid ];
  }); })
]
