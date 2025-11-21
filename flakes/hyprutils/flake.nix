{
  description = "Wrapper flake for stable hyprutils";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprutils.url = "github:hyprwm/hyprutils/v0.10.2";
  };

  outputs = { self, nixpkgs, hyprutils, ... }:
  let
    systems = [ "x86_64-linux" "aarch64-linux" ];
    forAllSystems = f:
      builtins.listToAttrs (map (system: {
        name = system;
        value = f system;
      }) systems);
  in
  {
    overlays.default = final: prev: {
      hyprutils = final.callPackage ./flake.nix { };
    };

    packages = forAllSystems (system:
      let
        defaultPkg = import nixpkgs {
          inherit system;
          overlays = [ self.overlays.default ];
        };
      in
      {
        hyprutils = defaultPkg;
        default = defaultPkg;
      });
  };
}
