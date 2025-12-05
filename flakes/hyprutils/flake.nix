{
  description = "Wrapper flake for stable hyprutils";

  inputs = {
    hyprutils = {
      type = "git";
      url = "https://github.com/hyprwm/hyprutils.git";
      ref = "refs/tags/v0.10.4";
    };
  };

  outputs = { self, hyprutils, ... }: hyprutils;
}
