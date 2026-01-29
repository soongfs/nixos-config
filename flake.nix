{
  description = "My NixOS config flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl.url = "github:nix-community/NixOS-WSL";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nixos-wsl, ... }: {
    nixosConfigurations = {
      nixos-tx = let
        username = "soongfs";
        specialArgs = { inherit inputs username; };
      in nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        system = "x86_64-linux";

        modules = [
          ./hosts/nixos-tx
          ./users/${username}

          home-manager.nixosModules.home-manager
        ];
      };

      nixos-wsl = let
        username = "soongfs";
        specialArgs = { inherit inputs username; };
      in nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        system = "x86_64-linux";

        modules = [
          nixos-wsl.nixosModules.wsl
          ./hosts/nixos-wsl
          ./users/${username}

          home-manager.nixosModules.home-manager
        ];
      };
    };
  };
}
