{ config, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = config.home.homeDirectory;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    initContent = ''
      for f in "$HOME/.config/zsh"/*.zsh(N); do
        source "$f"
      done
    '';
  };

  xdg.configFile."zsh" = {
    source = ./config/zsh;
    recursive = true;
  };
}
