{
  description = "Description for the project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    hyprland.url = "github:hyprwm/Hyprland";
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        ./home/profiles
        ./hosts
        ./modules
      ];

      systems = [ "x86_64-linux" ];

      perSystem = { config, pkgs, ... }:
      {
        devShells.default = pkgs.mkShell {
          name = "Dotfiles";
          packages = with pkgs; [
            cz-cli
            commitizen
          ];
        };
      };
    };
}
