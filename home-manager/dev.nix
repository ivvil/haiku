{pkgs, ...}:
{
  home.packages = with pkgs; [
    jetbrains.idea-community
    cmake
    libtool
    gnumake
    direnv
    ccls
  ];
}
