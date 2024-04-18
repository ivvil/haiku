{pkgs, ...}:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  programs.java.enable = true; 
  programs.steam.package = pkgs.steam.override { withJava = true; };
}
