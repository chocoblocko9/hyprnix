{
  description = "Wrapper flake for stable hyprcursor";

  inputs = {
    hyprutils.url = "path:../hyprutils";

    hyprcursor = {
      type = "git";
      url = "https://github.com/hyprwm/hyprcursor.git";
      ref = "refs/tags/v0.1.13";
    };

    hyprcursor.inputs.hyprutils.follows = "hyprutils";
  };

  outputs = { self, hyprcursor, ... }: hyprcursor;
}
