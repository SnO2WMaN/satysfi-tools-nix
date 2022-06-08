(import
  (
    let
      lock = builtins.fromJSON (builtins.readFile ./flake.lock);
      locked = lock.nodes.flake-compat.locked;
    in
      fetchTarball {
        url = "https://github.com/${locked.owner}/${locked.repo}/archive/${locked.rev}.tar.gz";
        sha256 = locked.narHash;
      }
  )
  {src = ./.;})
.shellNix
