{pkgs, ... }:
{
  programs = {
    steam = {
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      package = pkgs.steam.override { withJava = true; };
    };
    
    java.enable = true; 
  };





}
