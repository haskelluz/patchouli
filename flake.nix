{
  description = "Telegram bot assistant for @haskelluz community";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {localSystem = {inherit system;};};
      in {
        formatter = pkgs.alejandra;
        packages.default = pkgs.callPackage ./. {inherit pkgs;};
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            zlib
          ];
        };
      }
    );
}
