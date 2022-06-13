let
  lock = builtins.fromJSON (builtins.readFile ./flake.lock);
in
  final: prev: {
    satysfi-formatter = prev.callPackage ./pkgs/satysfi-formatter {
      locked = lock.nodes.satysfi-formatter.locked;
    };
    satysfi-language-server = prev.callPackage ./pkgs/satysfi-language-server {
      locked = lock.nodes.satysfi-language-server.locked;
    };
  }
