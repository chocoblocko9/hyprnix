{
  description = "Hypr* ecosystem stable release flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    hyprland.url = "path:./flakes/hyprland.nix";
  }

  outputs = inputs @ { self, nixpkgs, hyprland, ... }: let
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
        });
    };
}
