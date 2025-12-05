{
  description = "Wrapper flake for stable Hyprland";

  inputs = {
    hyprutils.url = "path:../hyprutils";
    aquamarine.url = "path:../aquamarine";
    hyprgraphics.url = "path:../hyprgraphics";
    hyprcursor.url = "path:../hyprcursor";
    hyprwayland-scanner.url = "path:../hyprwayland-scanner";
    hyprtoolkit.url = "path:../hyprtoolkit";
    hyprwire.url = "path:../hyprwire";
    hyprland-guiutils.url = "path:../hyprland-guiutils";

    # Hyprland package with overrides for stable deps
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland.git";
      ref = "refs/tags/v0.52.2";
    };

    hyprland.inputs.hyprutils.follows = "hyprutils";
    hyprland.inputs.aquamarine.follows = "aquamarine";
    hyprland.inputs.hyprgraphics.follows = "hyprgraphics";
    hyprland.inputs.hyprcursor.follows = "hyprcursor";
    hyprland.inputs.hyprwayland-scanner.follows = "hyprwayland-scanner";
    hyprland.inputs.hyprtoolkit.follows = "hyprtoolkit";
    hyprland.inputs.hyprwire.follows = "hyprwire";
    hyprland.inputs.hyprland-guiutils.follows = "hyprland-guiutils";
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
