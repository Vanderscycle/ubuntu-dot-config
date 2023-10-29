# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, lib, config, pkgs, ... }:
let
  dotfiles_dir = /home/henri/Documents/dotFiles;
  my-packages = /home/henri/Documents/houseOfNixAndPain;
  waterfox = (import "${my-packages}/waterfox" { pkgs = pkgs; });
  # devcontainers = (import "${my-packages}/devcontainers/"); # another day/ another fight
in
{
  # You can import other home-manager modules here
  imports = [
    ./modules/services
    ./modules/programs
    ./modules/languages
    ./unstable-packages.nix
  ];
  nixpkgs = {
    # You can add overlays here
    overlays = [
      # https://github.com/NixOS/nixpkgs/issues/157101
      (self: super: {
        waybar = super.waybar.overrideAttrs (oldAttrs: {
          mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
        });
      })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };
  home = {
    username = "henri";
    homeDirectory = "/home/henri";
    sessionVariables = {
      # FCITX input-related
      GTK_IM_MODULE="fcitx5";
      QT_IM_MODULE="fcitx5";
      XMODIFIERS="@im=fcitx5";
      GLFW_IM_MODULE="fcitx5";
      INPUT_METHOD            ="fcitx5";
      IMSETTINGS_MODULE       ="fcitx5";

      # Wayland compatibility
      NIXOS_OZONE_WL = "1";
      XDG_CURRENT_DESKTOP = "Sway";
      QT_QPA_PLATFORM = "wayland";
      CLUTTER_BACKEND         ="wayland";
      SDL_VIDEODRIVER         = "wayland";
      MOZ_ENABLE_WAYLAND      = 1;
      MOZ_WEBRENDER           = 1;
      XDG_SESSION_TYPE        ="wayland";

      # gtkUsePortal = [true]; #fix
      # other
      SUDO_EDITOR = "emacs";
      EDITOR = "hx";
      RIPGREP_CONFIG_PATH = "$HOME/.config/rg";
      BROWSER = "firefox";
      TERMINAL = "kitty";
      NNN_PLUG = "f:finder;o:fzopen;v:imgview;p:preview-tui;t:preview-tabbed";
      NNN_OPTS = "Hed";
      NNN_TMPFILE = "/tmp/nnn";
      NNN_FIFO = "/tmp/nnn.fifo";
      TLDR_AUTO_UPDATE_DISABLED = "false";
    };
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.05";
    # file = {
    #   "xprofile" = {
    #     source = "${dotfiles_dir}/.config/.xprofile";
    #     target = "./.xprofile";
    #   };
    #  };
    # of note: do not define a package here and then program.<name>.enable = true; it will cause a conflict
    packages = with pkgs; [
      # dbs only
      nitrogen
      #battery
      acpi
      # auto mount drives
      udisks
      udiskie
      # screenshots
      slurp
      grim
      swappy
      # flameshot # not working rn
      gnumake
      # wifi
      # nmcli
      # languages /fonts
      noto-fonts-emoji
      tldr
      #terraform
      terraform-ls
      # toml
      taplo
      # yaml
      yamlfix
      nodePackages.yaml-language-server
      # json
      nodePackages.vscode-json-languageserver
      # docker
      dive
      #lisp
      #grammar
      ispell
      # bash
      nodePackages.bash-language-server
      shellcheck
      # editing (3d/photos)
      shotwell
      # shell
      gnupg
      pinentry
      # client
      rclone
      awscli2
      linode-cli
      # cli
      unzip
      zoxide
      #3d printing/cad
      super-slicer-latest
      #keyboard
      wally-cli
      # gui/
      slides # terminal based powerpoint
      chafa # imag in terminal
      onlyoffice-bin # word/excel/etc
      rpi-imager
      signal-desktop
      gparted
      vlc # the only media player allowerd
      transmission-gtk
      xfce.thunar
      xfce.thunar-volman
      slack
      pulseaudioFull
      firefox
      # social
      zoom
      # nfs 
      nfs-utils
      # ssh
      sshpass
      # port
      lsof
      # custom pain
      # devcontainers
      waterfox
    ];
  };
  services = {
    gpg-agent = {
      enableSshSupport = true;
    };
  };
  programs = {
    gpg = {
      enable = true;
    };
    ssh = {
      #     enable = true;
      includes = [ "$HOME/.ssh/endeavourGit" "$HOME/.ssh/opsBox" ];
    };
    keychain = {
      enable = true;
      keys = [ "$HOME/.ssh/endeavourGit" ];
    };
    home-manager = {
      enable = true;
    };
    rofi = {
      enable = true;
    };
  };
  xsession = {
    windowManager.awesome.enable = true;
  }; # Nicely reload system units when changing configs
  # systemd.user.startServices = "sd-switch";

}
