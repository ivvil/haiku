{config, pkgs, ...}: {
  imports = [
    # ../home-manager/nvim.nix
    # ../home-manager/ags.nix
    ../home-manager/blackbox.nix
    ../home-manager/browser.nix
    # ../home-manager/bspwm.nix
    ../home-manager/dconf.nix
    ../home-manager/dev.nix
    ../home-manager/distrobox.nix
    ../home-manager/emacs.nix
    ../home-manager/gaming.nix
    ../home-manager/git.nix
    # ../home-manager/helix.nix
    # ../home-manager/hyprland.nix
    ../home-manager/lf.nix
    # ../home-manager/neofetch.nix
    ../home-manager/obs.nix
    ../home-manager/packages.nix
    ../home-manager/sh.nix
    ../home-manager/spotify.nix
    ../home-manager/starship.nix
    ../home-manager/stm.nix
    # ../home-manager/sway.nix
    ../home-manager/theme.nix
    ../home-manager/tmux.nix
    ../home-manager/wezterm.nix
  ];

  news.display = "show";

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    warn-dirty = false;
  };

  home = {
    sessionVariables = {
      QT_XCB_GL_INTEGRATION = "none"; # kde-connect
      NIXPKGS_ALLOW_UNFREE = "1";
      NIXPKGS_ALLOW_INSECURE = "1";
      BAT_THEME = "base16";
      GOPATH = "${config.home.homeDirectory}/.local/share/go";
      GOMODCACHE = "${config.home.homeDirectory}/.cache/go/pkg/mod";
    };

    sessionPath = [
      "$HOME/.local/bin"
    ];
  };

  gtk.gtk3.bookmarks = let
    home = config.home.homeDirectory;
  in [
    "file://${home}/Projects"
    "file://${home}/Programs"
    "file://${home}/Documents/DAW"
  ];

  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };
  };

  # XDG dirs
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  programs.home-manager.enable = true;
  home.stateVersion = "21.11";
}
