{ inputs, username, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/boot.nix
    ../../modules/clash-verge.nix
    ../../modules/fonts.nix
    ../../modules/gnome.nix
    ../../modules/locale.nix
    ../../modules/mirrors.nix
    ../../modules/network.nix
    ../../modules/nix-features.nix
    ../../modules/nix-ld.nix
    ../../modules/pipewire.nix
    ../../modules/print.nix
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
