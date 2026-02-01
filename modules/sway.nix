{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # 让 GTK 应用在 Wayland 下更顺
  };

  programs.xwayland.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  environment.sessionVariables = { NIXOS_OZONE_WL = "1"; };
}
