{
  description = "Port of S1M0N38's Tetris using Herb Sutter's CPP2 language";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs = { self, nixpkgs, ... }:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux; in
    {
      packages.x86_64-linux.cppfront = pkgs.callPackage ./cppfront.nix { };
      packages.x86_64-linux.default = pkgs.stdenv.mkDerivation {
        name = "tetris";
        src = ./src;
        buildInputs = [
          self.packages.x86_64-linux.cppfront
          pkgs.ncurses
        ];
        # Build is done with GNU Make, already handled by mkDerivation
        installPhase = ''
          mkdir -p $out/bin
          cp tetris $out/bin
        '';
      };
    };
}
