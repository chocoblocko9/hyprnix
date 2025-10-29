{
  pkgs ? import <nixpkgs> { },
  sources,
  ...
}:
let
  packages = {
    aquamarine = pkgs.callPackage ./aquamarine.nix { src = sources.aquamarine; };
    contrib = pkgs.callPackage ./contrib.nix { src = sources.contrib; };
    hyprcursor = pkgs.callPackage ./hyprcursor.nix { src = sources.hyprcursor; };
    hyprgraphics = pkgs.callPackage ./hyprgraphics.nix { src = sources.hyprgraphics; };
    hypridle = pkgs.callPackage ./hypridle.nix { src = sources.hypridle; };
    hyprland = pkgs.callPackage ./Hyprland.nix { src = sources.hyprland; };
    hyprland-protocols = pkgs.callPackage ./hyprland-protocols.nix {
      src = sources.hyprland-protocols;
    };
    hyprland-qt-support = pkgs.callPackage ./hyprland-qt-support.nix {
      src = sources.hyprland-qt-support;
    };
    hyprland-qtutils = pkgs.callPackage ./hyprland-qtutils.nix { src = sources.hyprland-qtutils; };
    hyprlang = pkgs.callPackage ./hyprlang.nix { src = sources.hyprlang; };
    hyprlauncher = pkgs.callPackage ./hyprlauncher.nix { src = sources.hyprlauncher; };
    hyprlock = pkgs.callPackage ./hyprlock.nix { src = sources.hyprlock; };
    hyprpaper = pkgs.callPackage ./hyprpaper.nix { src = sources.hyprpaper; };
    hyprpicker = pkgs.callPackage ./hyprpicker.nix { src = sources.hyprpicker; };
    hyprpolkitagent = pkgs.callPackage ./hyprpolkitagent.nix { src = sources.hyprpolkitagent; };
    hyprpwcenter = pkgs.callPackage ./hyprpwcenter.nix { src = sources.hyprpwcenter; };
    hyprqt6engine = pkgs.callPackage ./hyprqt6engine.nix { src = sources.hyprqt6engine; };
    hyprsunset = pkgs.callPackage ./hyprsunset.nix { src = sources.hyprsunset; };
    hyprsysteminfo = pkgs.callPackage ./hyprsysteminfo.nix { src = sources.hyprsysteminfo; };
    hyprtoolkit = pkgs.callPackage ./hyprtoolkit.nix { src = sources.hyprtoolkit; };
    hyprutils = pkgs.callPackage ./hyprutils.nix { src = sources.hyprutils; };
    hyprwayland-scanner = pkgs.callPackage ./hyprwayland-scanner.nix {
      src = sources.hyprwayland-scanner;
    };
    hyprwire = pkgs.callPackage ./hyprwire.nix { src = sources.hyprwire; };
    xdg-desktop-portal-hyprland = pkgs.callPackage ./xdg-desktop-portal-hyprland.nix {
      src = sources.xdg-desktop-portal-hyprland;
    };
  };
in
packages
