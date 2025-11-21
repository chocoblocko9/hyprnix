{
  description = "Wrapper flake for stable Hyprland";

  inputs = {
    hyprland.url = "github:hyprwm/Hyprland/v0.52.1";
  };

  outputs = { self, hyprland, ... }:
  let
    systems = [ "x86_64-linux" "aarch64-linux" ];
    forAllSystems = f:
      builtins.listToAttrs (map (system: {
        name = system;
        value = f system;
      }) systems);
  in
  {
    packages = forAllSystems (system:
      let defaultPkg = hyprland.packages.${system}.default;
      in
      {
        hyprland = defaultPkg;
        default = defaultPkg;
      });
  };
}
