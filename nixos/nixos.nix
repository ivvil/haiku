{pkgs, ...}: {
  imports = [
    /etc/nixos/hardware-configuration.nix
    /etc/nixos/cachix.nix
    ./audio.nix
    ./locale.nix
    ./gnome.nix
    # ./hyprland.nix
    # ./laptop.nix
    ./nvidia.nix
    ./printing.nix
    ./disks.nix
    ./steam.nix
    ./sync.nix
    ./video.nix
    ./virtualisation.nix
  ];

  # nix
  documentation.nixos.enable = false; # .desktop
  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  # Force electron apps to use ozone platform
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # camera
  programs.droidcam.enable = true;

  # ld
  programs.nix-ld.enable = true;

  # virtualisation
  programs.virt-manager.enable = true;
  virtualisation = {
    podman.enable = true;
    docker.enable = true;
    libvirtd.enable = true;
  };

  # fwupd
  services.fwupd.enable = true;

  # SANE
  hardware.sane.enable = true;
  # hardware.sane.extraBackends = [ pkgs.hplipWithPlugin ];

  # dconf
  programs.dconf.enable = true;

  # packages
  environment.systemPackages = with pkgs; [
    home-manager
    neovim
    git
    wget
  ];

  # services
  services = {
    xserver = {
      enable = true;
      excludePackages = [pkgs.xterm];
    };
    printing.enable = true;
    flatpak.enable = true;
  };

  # logind
  services.logind.extraConfig = ''
    HandlePowerKey=ignore
    HandleLidSwitch=suspend
    HandleLidSwitchExternalPower=ignore
  '';

  # kde connect
  networking.firewall = rec {
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };

  # network
  networking.networkmanager.enable = true;

  # bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    settings.General.Experimental = true; # for gnome-bluetooth percentage
  };

  # bootloader
  boot = {
    tmp.cleanOnBoot = true;
    supportedFilesystems = ["ntfs"];
    loader = {
      timeout = 2;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth = rec {
      enable = true;
      # black_hud circle_hud cross_hud square_hud
      # circuit connect cuts_alt seal_2 seal_3
      theme = "connect";
      themePackages = with pkgs; [
        (
          adi1090x-plymouth-themes.override {
            selected_themes = [theme];
          }
        )
      ];
    };
  };

  system.stateVersion = "23.05";
}
