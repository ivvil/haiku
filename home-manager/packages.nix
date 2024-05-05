{pkgs, ...}: {
  imports = [
    ./scripts/blocks.nix
    ./scripts/nx-switch.nix
    ./scripts/vault.nix
  ];

  xdg.desktopEntries = {
    "lf" = {
      name = "lf";
      noDisplay = true;
    };
  };

  home.packages = with pkgs; with gnome; [
    # gui
    (mpv.override {scripts = [mpvScripts.mpris];})
    libreoffice
    spotify
    caprine-bin
    d-spy
    github-desktop
    gimp
    fragments
    discord
    vesktop
    icon-library
    dconf-editor
    gnome-secrets
    gnome.simple-scan

    # langs
    poetry
    nodejs
    yarn
    go

    # tools
    steam-run # fhs envs
    bat
    eza
    fd
    ripgrep
    fzf
    libnotify
    killall
    zip
    unzip
    glib
    tor-browser
    inkscape-with-extensions
    zathura

    # fun
    glow
    slides
    yabridge
    yabridgectl
    wine-staging
  ];
}
