{pkgs, ...}:
{
  home.packages = with pkgs; [
    jetbrains.idea-community-bin
    cmake
    libtool
    gnumake
    direnv
    ccls
    sbcl
    godot_4
    scons
    marksman
    texlive.combined.scheme-full
    # python311Packages.pygments
    vscode
    jdk
    synology-drive-client
    gcc
    cargo
    rustc
    rust-analyzer
    rustfmt
    clippy
  ];
}
