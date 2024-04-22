# ============================================================================================
#
# ███╗   ██╗██╗██╗  ██╗ ██████╗ ███████╗     ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗ 
# ████╗  ██║██║╚██╗██╔╝██╔═══██╗██╔════╝    ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝ 
# ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║███████╗    ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
# ██║╚██╗██║██║ ██╔██╗ ██║   ██║╚════██║    ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
# ██║ ╚████║██║██╔╝ ██╗╚██████╔╝███████║    ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
# ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝ 
#
# ============================================================================================
{
  description = "My personal computers nix configurations";

  inputs = {
    hosts.url = "github:StevenBlack/hosts";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    catppuccin.url = "github:catppuccin/nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      hosts,
      catppuccin,
      home-manager,
      ...
    }@attrs:
    let
      supportedSystems = [ "x86_64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
    in
    {
      nixosConfigurations = {
        desktop =
          let
            system = "x86_64-linux";
          in
          nixpkgs.lib.nixosSystem {
            specialArgs = {
              username = "henri";
              hostname = "desktop";
              palete-color = "mocha";
              inherit system;
            } // attrs;
            modules = [
              ./.
              ./modules/programs/gaming
              #./modules/desktop-environment/xfce
              ./modules/window-managers/hyprland
              ./modules/status-bars/waybar
              #./modules/containers
              ./users/henri/programs/transmission
              hosts.nixosModule
              { networking.stevenBlackHosts.enable = true; }
              catppuccin.nixosModules.catppuccin
              home-manager.nixosModules.home-manager
            ];
          }; # desktop

        laptop =
          let
            system = "x86_64-linux";
          in
          nixpkgs.lib.nixosSystem {
            specialArgs = {
              username = "henri";
              hostname = "laptop";
              palete-color = "mocha";
              inherit system;
            } // attrs;
            modules = [
              ./.
              ./modules/desktop-environment/xfce
              ./modules/window-managers/lightdm
              hosts.nixosModule
              { networking.stevenBlackHosts.enable = true; }
              catppuccin.nixosModules.catppuccin
              home-manager.nixosModules.home-manager
            ];
          }; # laptop
      }; # nixosConfigurations

      templates.default = {
        path = ./.;
        description = "The default template for common nixflakes.";
      }; # templates

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    };
}
