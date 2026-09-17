{
  description = "A Nix-flake development environment for Python with Ruff";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      python = pkgs.python3.override {
        packageOverrides = final: prev: {
          opencv4 = prev.opencv4Full;
        };
      };
      pythonEnv = python.withPackages (
        ps: with ps; [
          numpy
          opencv4Full
          torchvision
          ultralytics
        ]
      );
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pythonEnv
          pkgs.ruff
        ];
      };
    };
}
