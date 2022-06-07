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

    satysfi-formatter.url = "github:SnO2WMaN/satysfi-formatter/nix-integrate";
    satysfi-lsp.url = "github:SnO2WMaN/satysfi-language-server/nix-integrate";

    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };
  outputs =
    { self
    , nixpkgs
    , flake-utils
    , devshell
    , satysfi-formatter
    , satysfi-lsp
    , ...
    } @ inputs:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ devshell.overlay ];
      };
    in
    rec {
      overlay = (final: prev: {
        satysfi-tools = {
          satysfi-formatter = satysfi-formatter.packages."${system}".default;
          satysfi-language-server = satysfi-formatter.packages."${system}".default;
        };
      });

      # `nix develop`
      devShell = pkgs.devshell.mkShell {
        imports = [
          (pkgs.devshell.importTOML ./devshell.toml)
        ];
      };
    }
    );
}
