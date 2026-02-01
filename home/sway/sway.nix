{ pkgs, ... }:

{
  home.packages = with pkgs; [ swaybg grim slurp ];

  programs.fuzzel.enable = true;

  services.mako.enable = true;

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;
    xwayland = true;

    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      menu = "fuzzel";
    };
  };
}
