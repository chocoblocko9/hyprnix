{
  description = "Wrapper flake for stable hyprwire";

  inputs = {
    hyprutils.url = "path:../hyprutils";

    hyprwire = {
      type = "git";
      url = "https://github.com/hyprwm/hyprwire.git";
      ref = "refs/tags/v0.2.1";
    };

    hyprwire.inputs.hyprutils.follows = "hyprutils";
  };

  outputs = { self, hyprwire, ... }: hyprwire;
}
