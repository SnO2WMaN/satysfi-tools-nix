{ nixpkgs }: rec {
  language-server = nixpkgs.callPackage ./satysfi-language-server { };
  formatter = nixpkgs.callPackage ./satysfi-formatter { };
}
