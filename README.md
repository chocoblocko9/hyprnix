# HyprWM Nix Repo

Hypr Ecosystem releases in one place.

## Packages

To view a list of all packages, either check the `flake.nix` file or run:

```sh
nix flake show github:hyprwm/hyprnix
```

## Installing

> [!IMPORTANT]
> Make sure to set up [Cachix](https://wiki.hypr.land/Nix/Cachix/) before installing.

> [!NOTE]
> All snippets in the wiki that advise using `inputs.hyprland` should be changed to `inputs.hyprnix` instead.
> `inputs.hyprland.url = "github:hyprwm/hyprland"` should be changed to `inputs.hyprnix.url = "github:hyprwm/hyprnix"`.

### NixOS

Follow the guide over at [Hyprland on NixOS](https://wiki.hypr.land/Nix/Hyprland-on-NixOS/).

### Non-NixOS (other distros)

Follow the guide over at [Hyprland on Other Distros](https://wiki.hypr.land/Nix/Hyprland-on-other-distros/).
