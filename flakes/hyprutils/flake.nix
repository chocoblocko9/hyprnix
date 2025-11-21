{
  description = "Wrapper flake for stable hyprutils";

  inputs.hyprutils.url = "github:hyprwm/hyprutils/v0.10.1";

  outputs = { self, hyprutils, ... }: hyprutils;
}
