{
  description = "Haiku; ivvil's NixOS config";

  outputs = inputs @ {
    self,
      home-manager,
      nix-darwin,
      nixpkgs,
      ...
  }: {
    formatter = {
      x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
      x86_64-darwin = nixpkgs.legacyPackages.x86_64-darwin.alejandra;
    };

    packages.x86_64-linux.default =
      nixpkgs.legacyPackages.x86_64-linux.callPackage ./ags {inherit inputs;};

    nixpkgs.overlays = [ (import self.inputs.emacs-overlay) ];

    # nixos config
    nixosConfigurations = {
      "aceso" = let
        hostname = "aceso";
        username = "ivvil";
      in
        nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            asztal = self.packages.x86_64-linux.default;
          };
          modules = [
            ./nixos/nixos.nix
            home-manager.nixosModules.home-manager
            {
              users.users.${username} = {
                isNormalUser = true;
                initialPassword = username;
                extraGroups = [
                  "nixosvmtest"
                  "networkmanager"
                  "wheel"
                  "audio"
                  "video"
                  "libvirtd"
                  "docker"
                  "scanner"
                  "lp"
                  "user-with-access-to-virtualbox"
                ];
              };
              networking.hostName = hostname;
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = specialArgs;
                users.${username} = {
                  home.username = username;
                  home.homeDirectory = "/home/${username}";
                  imports = [./nixos/home.nix];
                };
              };
            }
          ];
        };
    };

    # macos
    darwinConfigurations = {
      "macos" = let
        username = "ivvil";
      in
        nix-darwin.lib.darwinSystem {
          modules = [
            ./macos/macos.nix
            home-manager.darwinModules.home-manager
            {
              users.users.${username} = {
                name = username;
                home = "/Users/${username}";
              };
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {inherit inputs;};
                users."${username}" = {
                  home.username = username;
                  home.homeDirectory = "/Users/${username}";
                  imports = [./macos/home.nix];
                };
              };
              networking = {
                hostName = "macos";
                computerName = "macos";
              };
            }
          ];
        };
    };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    spicetify-nix.url = "github:the-argus/spicetify-nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "git+https://github.com/andresilva/Hyprland?ref=nix-build-improvements&submodules=1";
    };
    
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    matugen.url = "github:InioX/matugen?ref=v2.2.0";
    ags.url = "github:Aylur/ags";
    astal.url = "github:Aylur/astal";
    stm.url = "github:Aylur/stm";

    lf-icons = {
      url = "github:gokcehan/lf";
      flake = false;
    };
    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };
    
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}













