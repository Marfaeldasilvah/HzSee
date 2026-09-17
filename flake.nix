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
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          ruff
          python3
          python3Packages.torchvision
          python3Packages.ultralytics
          python3Packages.opencv4Full
        ];
      };
    };
}
