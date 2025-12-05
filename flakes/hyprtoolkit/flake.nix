{
  description = "Wrapper flake for stable hyprtoolkit";

  inputs = {
    hyprutils.url = "path:../hyprutils";
    aquamarine.url = "path:../aquamarine";
    hyprlang.url = "path:../hyprlang";
    hyprgraphics.url = "path:../hyprgraphics";
    hyprwayland-scanner.url = "path:../hyprwayland-scanner";

    hyprtoolkit = {
      type = "git";
      url = "https://github.com/hyprwm/hyprtoolkit.git";
      ref = "refs/tags/v0.4.1";
    };

    hyprtoolkit.inputs.hyprutils.follows = "hyprutils";
    hyprtoolkit.inputs.aquamarine.follows = "aquamarine";
    hyprtoolkit.inputs.hyprlang.follows = "hyprlang";
    hyprtoolkit.inputs.hyprgraphics.follows = "hyprgraphics";
    hyprtoolkit.inputs.hyprwayland.follows = "hyprwayland-scanner";
  };

  outputs = { self, hyprtoolkit, ... }: hyprtoolkit;
}
