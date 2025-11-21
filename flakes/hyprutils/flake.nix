{
  description = "Wrapper flake for stable hyprutils";

  inputs.hyprutils.url = "github:hyprwm/hyprutils/v0.10.2";

  outputs = { self, hyprutils, ... }: hyprutils;
}
