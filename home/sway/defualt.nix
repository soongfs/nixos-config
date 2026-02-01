{pkgs,...}:

{
  home.packages=with pkgs;[
    fuzzel
    brightnessctl
    grim
    swaynag
    swayidle
    swaylock
  ];
}
