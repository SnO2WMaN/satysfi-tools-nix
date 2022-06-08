{ lib, stdenv, fetchFromGitHub, rustPlatform, ... }:
rustPlatform.buildRustPackage rec {
  pname = "satysfi-language-server";
  version = "c48b59c248b5e4deb6dc9cd6a2a0df27af53bbce";

  src = fetchFromGitHub {
    owner = "monaqa";
    repo = "satysfi-language-server";
    rev = version;
    sha256 = "SkMP33VOKMDgCuxWWZhsITUpwZo13NPDRO0nuHYIBN8=";
  };

  cargoSha256 = "sha256-OJFdVTHq9eoXBVfm+XQKl3uEcv8bXFEw/7CQQhv/YlE=";

  meta = with lib; {
    homepage = "https://github.com/monaqa/satysfi-language-server";
    license = licenses.mit;
  };
}
