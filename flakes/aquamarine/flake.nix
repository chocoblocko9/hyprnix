{
  description = "Wrapper flake for stable aquamarine";

  inputs = {
    hyprutils.url = "path:../hyprutils";
    hyprwayland-scanner.url = "path:../hyprwayland-scanner";

    aquamarine = {
      type = "git";
      url = "https://github.com/hyprwm/aquamarine.git";
      ref = "refs/tags/v0.10.0";
    };

    aquamarine.inputs.hyprutils.follows = "hyprutils";
    aquamarine.inputs.hyprwayland-scanner.follows = "hyprwayland-scanner";
  };

  outputs = { self, aquamarine, ... }: aquamarine;
}
