{ ... }:

{
  programs.eza = {
    enable = true;
    enableZshIntegration = false;
  };

  xdg.configFile."eza" = {
    source = ./config/eza;
    recursive = true;
  };
}
