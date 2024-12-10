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
    ../../home-modules/programs/nnn.nix
    ../../home-modules/programs/starship.nix
    ../../home-modules/programs/modern_unix.nix
    ../../home-modules/programs/zsh.nix
    ../../home-modules/programs/nushell.nix
    ../../home-modules/programs/keychain.nix
    ../../home-modules/programs/spacemacs.nix
    ../../home-modules/programs/spotify.nix
    ../../home-modules/programs/vim.nix
    ../../home-modules/programs/devops.nix
    ../../home-modules/programs/nh.nix
    ../../home-modules/programs/libreoffice.nix
    ../../home-modules/programs/multimedia.nix
    ../../home-modules/programs/plastic_printer.nix
    ../../home-modules/programs/microcontrollers.nix
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

  kubernetes.enable = true;
  discord.enable = true;
  fish.enable = true;
  fuzzel.enable = true;
  git.userEmail = "henri-vandersleyen@protonmail.com";
  git.userName = "vanderscycle";
  git.signingKey = "~/.ssh/endeavourGit.pub";
  # cowsay.enable = lib.mkForce true;

  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # Makes sense for user specific applications that shouldn't be available system-wide
  home.packages = with pkgs; [
    beekeeper-studio
    insomnia
    sysz
  ];

  home.file = { };

  home.sessionVariables = {
    # for nh
    FLAKE = "/home/${username}/Documents/dotFiles/nix-darwin";
  };

  home.sessionPath = [
    # "/run/current-system/sw/bin"
    #  "$HOME/.nix-profile/bin"
  ];

  programs.home-manager.enable = true;

  # theme
  catppuccin.flavor = "mocha";
  catppuccin.enable = true;
}
