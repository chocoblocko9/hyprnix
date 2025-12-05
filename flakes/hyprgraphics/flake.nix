{
  description = "Wrapper flake for stable hyprgraphics";

  inputs = {
    hyprutils.url = "path:../hyprutils";

    hyprgraphics = {
      type = "git";
      url = "https://github.com/hyprwm/hyprgraphics.git";
      ref = "refs/tags/v0.4.0";
    };

    hyprgraphics.inputs.hyprutils.follows = "hyprutils";
  };

  outputs = { self, hyprgraphics, ... }: hyprgraphics;
}
