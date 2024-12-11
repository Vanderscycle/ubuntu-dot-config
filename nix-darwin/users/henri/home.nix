# home.nix
# home-manager switch

{
  config,
  username,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    #
    ../../home-modules/programs
    # languages
    ../../home-modules/languages/nix.nix
    ../../home-modules/languages/python.nix
    ../../home-modules/languages/jsts.nix
    ../../home-modules/languages/bash.nix
    ../../home-modules/languages/go.nix
    ../../home-modules/languages/latex.nix
    # services
    ../../home-modules/services/fcitx.nix
    ../../home-modules/services/ssh.nix
    ../../home-modules/services/dunst.nix
    ../../home-modules/services/gnome.nix
    # wm
    ../../home-modules/window-managers/hyprland
    # bar
    ../../home-modules/status-bars/waybar
  ];

  signal.enable = true;
  zathura.enable = true;
  nh.flakeLocation = "/home/${username}/Documents/dotFiles/nix-darwin";
  microcontrollers.enable = true;
  office.enable = true;
  kubernetes.enable = true;
  discord.enable = true;
  fish.enable = true;
  fuzzel.enable = true;
  git.userEmail = "henri-vandersleyen@protonmail.com";
  git.userName = "vanderscycle";
  git.signingKey = "~/.ssh/endeavourGit.pub";
  keychain.enable = true;
  keychain.keys = "/home/henri/.ssh/endeavourGit";
  # cowsay.enable = lib.mkForce true;

  # Makes sense for user specific applications that shouldn't be available system-wide
  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "25.05"; # Please read the comment before changing.
    packages = with pkgs; [
      sysz
    ];
    file = { };
    sessionVariables = { };
    sessionPath = [ ];
  };

  programs.home-manager.enable = true;

  # theme
  catppuccin.flavor = "mocha";
  catppuccin.enable = true;
}
