{ ... }:

{
  programs.bat.enable = true;

  xdg.configFile."bat" = {
    source = ./config/bat;
    recursive = true;
  };
}
