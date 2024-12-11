{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    office.enable = lib.mkOption {
      type = lib.types.bool;
      description = "Enables libreoffice";
      default = false;
    };
  };

  config = lib.mkIf config.office.enable {
    home.packages = with pkgs; [
      libreoffice-qt
      hunspell
      hunspellDicts.en_CA
      hunspellDicts.en_US
    ];
  };
}
