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

  cargoSha256 = "sha256-DgrKQ3NIGtBRgAKYPWz4/4odHIk6o6q4OxAmJ80J9Zo=";

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/usagrada/satysfi-formatter";
    license = licenses.mit;
  };
}
