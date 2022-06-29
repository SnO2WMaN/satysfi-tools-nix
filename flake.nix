{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    devshell.url = "github:numtide/devshell";

    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
    satysfi-formatter = {
      url = "github:usagrada/satysfi-formatter";
      flake = false;
    };
    satysfi-language-server = {
      url = "github:monaqa/satysfi-language-server";
      flake = false;
    };
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
    devshell,
    ...
  } @ inputs:
    rec {
      overlays.default = import ./overlay.nix;
      overlay = overlays.default;
    }
    // flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          devshell.overlay
          self.overlay
        ];
      };
    in {
      packages.satysfi-formatter = pkgs.satysfi-formatter;
      packages.satysfi-language-server = pkgs.satysfi-language-server;

      # `nix develop`
      devShell = pkgs.devshell.mkShell {
        imports = [
          (pkgs.devshell.importTOML ./devshell.toml)
        ];
      };

      checks = self.packages.${system};
    });
}
