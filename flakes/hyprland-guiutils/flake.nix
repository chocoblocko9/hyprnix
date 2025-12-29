{
  description = "Wrapper flake for stable hyprland-guiutils";

  inputs = {
    hyprutils.url = "path:../hyprutils";
    aquamarine.url = "path:../aquamarine";
    hyprtoolkit.url = "path:../hyprtoolkit";
    hyprlang.url = "path:../hyprlang";
    hyprgraphics.url = "path:../hyprgraphics";
    hyprwayland-scanner.url = "path:../hyprwayland-scanner";

    hyprland-guiutils = {
      type = "git";
      url = "https://github.com/hyprwm/hyprland-guiutils.git";
      ref = "refs/tags/v0.2.1";
    };

    hyprland-guiutils.inputs.hyprutils.follows = "hyprutils";
    hyprland-guiutils.inputs.aquamarine.follows = "aquamarine";
    hyprland-guiutils.inputs.hyprtoolkit.follows = "hyprtoolkit";
    hyprland-guiutils.inputs.hyprlang.follows = "hyprlang";
    hyprland-guiutils.inputs.hyprgraphics.follows = "hyprgraphics";
    hyprland-guiutils.inputs.hyprwayland.follows = "hyprwayland-scanner";
  };

  outputs = { self, hyprland-guiutils, ... }: hyprland-guiutils;
}
