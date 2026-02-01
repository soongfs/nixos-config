{ inputs, username, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common
    ../../modules/boot.nix
    ../../modules/clash-verge.nix
    ../../modules/fonts.nix
    ../../modules/gnome.nix
    ../../modules/network.nix
    ../../modules/pipewire.nix
    ../../modules/print.nix
    ../../modules/sway.nix
    ../../modules/touchpad.nix
    ../../modules/unfree.nix
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = inputs // { inherit username; };
    users.${username} = import ./home.nix;
  };

  networking.hostName = "nixos-tx";

  system.stateVersion = "25.05";
}
