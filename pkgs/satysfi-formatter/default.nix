{ lib, stdenv, fetchFromGitHub, rustPlatform, ... }:
rustPlatform.buildRustPackage rec {
  pname = "satysfi-formatter";
  version = "v0.1.1";

  src = fetchFromGitHub {
    owner = "usagrada";
    repo = "satysfi-formatter";
    rev = version;
    sha256 = "sha256-kuGJ61UzmDDaV7GfPIelk7GOO6HSYidcNX+wrO2fSW4=";
  };

  cargoSha256 = "sha256-IhmddT0wLZCVj6/RVoi0OXayoexHj57gs9lJoKBNmG4=";

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/usagrada/satysfi-formatter";
    license = licenses.mit;
  };
}
