{ pkgs, ... }:

{
  imports = [
    ./eza.nix
    ./fzf.nix
    ./git.nix
    ./lazygit.nix
    ./nvim.nix
    ./starship.nix
    ./xdg.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    ripgrep
    fd
    jq
    tree
    fastfetch
    man-pages
    man-pages-posix
    gh
    curl
    wget
    unzip
  ];
}
