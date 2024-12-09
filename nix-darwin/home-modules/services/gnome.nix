{
  pkgs,
  ...
}:
{
  home = {
    packages = with pkgs; [
      lxappearance
      # rose-pine-cursor
    ];
  };

  services.gnome-keyring.enable = true;
  # INFO used for lxappearance dark mode theme
  gtk = {
    enable = true;
    iconTheme = {
      name = "rose-pine-cursor";
      package = pkgs.rose-pine-cursor;
    };
    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
  qt = {
    style = {
      package = pkgs.adwaita-qt;
      name = "adwaita-dark";
    };
  };
}
