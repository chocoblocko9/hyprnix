{
  src,
  lib,
  stdenv,
  stdenvAdapters,
  cmake,
  pkg-config,
  cairo,
  file,
  hyprutils,
  libheif,
  libjpeg,
  libjxl,
  librsvg,
  libspng,
  libwebp,
  pango,
  pixman,
  version ? "git",
  doCheck ? false,
  debug ? false,
  withMold ? true,
}:
let
  inherit (builtins) foldl';
  inherit (lib.lists) flatten;

  adapters = flatten [
    (lib.optional withMold stdenvAdapters.useMoldLinker)
    (lib.optional debug stdenvAdapters.keepDebugInfo)
  ];

  customStdenv = foldl' (acc: adapter: adapter acc) stdenv adapters;
in
customStdenv.mkDerivation {
  pname = "hyprgraphics";
  inherit version doCheck src;

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [
    cairo
    file
    hyprutils
    libheif
    libjpeg
    libjxl
    librsvg
    libspng
    libwebp
    pango
    pixman
  ];

  outputs = [
    "out"
    "dev"
  ];

  cmakeBuildType = if debug then "Debug" else "RelWithDebInfo";

  meta = with lib; {
    homepage = "https://github.com/hyprwm/hyprgraphics";
    description = "Small C++ library with graphics / resource related utilities used across the hypr* ecosystem";
    license = licenses.bsd3;
    platforms = platforms.linux;
  };
}
