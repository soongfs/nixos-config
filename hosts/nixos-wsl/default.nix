{ inputs, username, ... }:

{
  imports = [ ../../modules/common ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = inputs // { inherit username; };
    users.${username} = import ./home.nix;
  };

  networking.hostName = "nixos-wsl";

  wsl.enable = true;
  wsl.defaultUser = username;

  system.stateVersion = "25.05";
}
