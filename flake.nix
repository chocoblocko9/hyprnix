{
  description = "Hypr* ecosystem stable release flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    hyprland.url = "path:./flakes/hyprland";
    hyprutils.url = "path:./flakes/hyprutils";
  };

  outputs = inputs @ { self, nixpkgs, hyprland, hyprutils, ... }: let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = f:
        nixpkgs.lib.genAttrs systems (system:
          f {
            inherit system;
            pkgs = import nixpkgs { inherit system; };
          });
    in {
      packages = forAllSystems ({ pkgs, system }:
        {
          hyprland = hyprland.packages.${system}.default;
          hyprutils = hyprutils.packages.${system}.default;
        });
    };
}
