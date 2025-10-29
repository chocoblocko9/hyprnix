{
  src,
  lib,
  stdenv,
  cmake,
  pkg-config,
  hyprland-protocols,
  hyprutils,
  hyprwayland-scanner,
  wayland,
  wayland-protocols,
  wayland-scanner,
  version ? "git",
}:
stdenv.mkDerivation {
  pname = "hyprsunset";
  inherit version src;

  nativeBuildInputs = [
    cmake
    pkg-config
    hyprwayland-scanner
  ];

  buildInputs = [
    hyprland-protocols
    hyprutils
    wayland
    wayland-protocols
    wayland-scanner
  ];

  meta = {
    homepage = "https://github.com/hyprwm/hyprsunset";
    description = "An application to enable a blue-light filter on Hyprland";
    license = lib.licenses.bsd3;
    platforms = lib.platforms.linux;
    mainProgram = "hyprsunset";
  };
}
