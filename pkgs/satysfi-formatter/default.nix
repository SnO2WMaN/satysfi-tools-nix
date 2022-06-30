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

  cargoSha256 = "sha256-3s3gpuoxEZS/o7Nyltf7xiRTk6+rKcGZl2yuwhZt2T0=";

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/usagrada/satysfi-formatter";
    license = licenses.mit;
  };
}
