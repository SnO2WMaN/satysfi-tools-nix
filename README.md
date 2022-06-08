## Usage

### Flake

`flake.nix`

```nix
{
  inputs = {
    devshell.url = "github:numtide/devshell";
    satysfi-tools.url = "github:SnO2WMaN/satysfi-tools-nix";
  };
  outputs = {
    self,
    flake-utils,
    satysfi-tools,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            satysfi-tools.overlay
          ];
        };
      in {
        devShell = pkgs.devshell.mkShell {
          imports = [
            (pkgs.devshell.importTOML ./devshell.toml)
          ];
        };
      }
    );
}
```

`devshell.toml`

```toml
[devshell]
packages = [
  "satysfi",
  "satysfi-formatter",
  "satysfi-language-server",
]
```
