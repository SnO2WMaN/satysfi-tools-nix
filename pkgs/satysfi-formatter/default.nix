{
  lib,
  stdenv,
  fetchFromGitHub,
  rustPlatform,
  locked,
  ...
}:
rustPlatform.buildRustPackage rec {
  pname = "satysfi-formatter";
  version = src.rev;

  src = fetchFromGitHub {
    inherit (locked) owner repo rev;
    sha256 = locked.narHash;
  };

  cargoSha256 = "sha256-+8aVSqORYJpnZRNE9bleSmLORk+JWEvSgbiN4Sz7YAc=";

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/usagrada/satysfi-formatter";
    license = licenses.mit;
  };
}
