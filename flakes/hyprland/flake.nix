{
  description = "Wrapper flake for stable Hyprland";

  inputs = {
    hyprutils.url = "path:../hyprutils";

    # Hyprland package with overrides for stable deps
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland.git";
      ref = "refs/tags/v0.52.2";
    };

    hyprland.inputs.hyprutils.follows = "hyprutils";
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
      let defaultPkg = hyprland.packages.${system}.hyprland;
      in
      {
        hyprland = defaultPkg;
        default = defaultPkg;
      });
  };
}
