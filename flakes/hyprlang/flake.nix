{
  description = "Wrapper flake for stable hyprlang";

  inputs = {
    hyprutils.url = "path:../hyprutils";

    hyprlang = {
      type = "git";
      url = "https://github.com/hyprwm/hyprlang.git";
      ref = "refs/tags/v0.6.7";
    };

    hyprlang.inputs.hyprutils.follows = "hyprutils";
  };

  outputs = { self, hyprlang, ... }: hyprlang;
}
