{
  description = "My private repo with multiple targets";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = f:
        nixpkgs.lib.genAttrs systems (system:
          f (import nixpkgs { inherit system; }));
    in {
      packages = forAllSystems (pkgs:
        let
          hyprland = import ./flakes/hyprland.nix { inherit pkgs; };
        in {
          hyprland = hyprland;
        });
    };
}
