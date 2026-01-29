{ pkgs, ... }:

{
  home.packages = with pkgs; [
    clang-tools
    nil
    nixfmt
    uv
    rustup
    gdb
    gcc
    python3
  ];
}
