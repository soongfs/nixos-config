{ ... }:

{
  programs.alacritty.enable = true;

  xdg.configFile."alacritty" = {
    source = ./config/alacritty;
    recursive = true;
  };
}
