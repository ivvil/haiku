{pkgs, ...}:
{
  home.packages = with pkgs; [
    jetbrains.idea-community
    cmake
    libtool
    gnumake
    direnv
    ccls
    sbcl
    godot_4
    jdk17
    scons
    marksman
    texlive.combined.scheme-full
    python311Packages.pygments
  ];
}
