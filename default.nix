{pkgs ? import <nixpkgs> {}}: let
  # Add this if you are building a devShell in a flake. Usually, it's auto-detected
  # using lib.inNixShell, but that doesn't work in flakes
  # returnShellEnv = true;
in
  pkgs.haskellPackages.developPackage {
    name = "telegram-assistant";
    root = ./.;

    modifier = drv:
      pkgs.haskell.lib.addBuildTools drv (with pkgs.haskellPackages; [
        cabal-install
        telegram-bot-api
        ghcid
      ]);
  }
