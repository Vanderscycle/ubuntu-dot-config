{
  home-manager,
  username,
  pkgs,
  lib,
  ...
}:
let
  # https://github.com/NixOS/nixpkgs/pull/335923/files
  dbeaver-bin-custom = pkgs.dbeaver-bin.overrideAttrs (oldAttrs: {
    installPhase = ''
      runHook preInstall
      mkdir -p $out/opt/dbeaver $out/bin
      cp -r * $out/opt/dbeaver
      makeWrapper $out/opt/dbeaver/dbeaver $out/bin/dbeaver \
        --prefix PATH : "${pkgs.openjdk17}/bin" \
        --set JAVA_HOME "${pkgs.openjdk17.home}" \
        --prefix LD_LIBRARY_PATH : "${
          lib.makeLibraryPath [
            pkgs.swt
            pkgs.gtk3
            pkgs.glib
          ]
        }"
    '';
  });
in
{
  nixpkgs.config.packageOverrides = pkgs: { };
  home-manager.users.${username} = {
    home = {
      packages = with pkgs; [
        # hardrives
        gparted
        # sql/db
        dbeaver-bin-custom
        # k8s
        kubernetes
        kubernetes-helm
        kustomize
        kubeseal
        kind
        tilt
        ctlptl
        argocd
        # github actions
        act
        # terraform
        terraform
        terraform-docs
        terragrunt
        # docker
        dive # dive into docker images
        # ansible
        ansible
        # backend api calls
        insomnia
        # dns
        dogdns
        nssmdns # for local rpi cluster
      ];
    };
  };
}
