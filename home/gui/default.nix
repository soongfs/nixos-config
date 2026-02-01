{ pkgs, ... }:

{
  imports = [ ./alacritty.nix ./fcitx5.nix ./firefox.nix ./fuzzel.nix ];

  home.packages = with pkgs; [ vscode zed-editor ];
}

