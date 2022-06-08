{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
    devshell = {
      url = "github:numtide/devshell";
    };
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };
  outputs =
    { self, nixpkgs, flake-utils, devshell, ... } @ inputs:
    {
      overlays.default = import ./overlay.nix;
      overlay = overlays.default;
    } //
    flake-utils.lib.eachDefaultSystem (system: rec {
      # `nix develop`
      devShell = pkgs.devshell.mkShell {
        imports = [
          (pkgs.devshell.importTOML ./devshell.toml)
        ];
      };
    });
}
