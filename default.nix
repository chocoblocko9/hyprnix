{
  sources ? (import ./npins),
  self ? (import ./. { }),
  system ? (builtins.currentSystem or null),
  nixpkgs ? sources.nixpkgs,
  pkgs ? (import nixpkgs { inherit system; }),
  lib ? pkgs.lib,
  ...
}@args:
{
  inherit sources self;
  # Allow using "${self}" to use the project path
  # outPath = ./.;
}
