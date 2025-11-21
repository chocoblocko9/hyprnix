{
  description = "Wrapper flake for stable hyprutils";

  inputs = {
    hyprutils.url = "github:hyprwm/hyprutils/v0.10.2";
  };

  outputs = { self, hyprutils, ... }:
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
      let defaultPkg = hyprutils.packages.${system}.default;
      in
      {
        hyprutils = defaultPkg;
        default = defaultPkg;
      });
  };
}
