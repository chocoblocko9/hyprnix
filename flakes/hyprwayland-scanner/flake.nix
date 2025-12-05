{
  description = "Wrapper flake for stable hyprwayland-scanner";

  inputs = {
    hyprwayland-scanner = {
      type = "git";
      url = "https://github.com/hyprwm/hyprwayland-scanner.git";
      ref = "refs/tags/v0.4.5";
    };
  };

  outputs = { self, hyprwayland-scanner, ... }: hyprwayland-scanner;
}
