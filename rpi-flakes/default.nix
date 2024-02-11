{ username, hostname, interface, pkgs, lib, ... }:

let
  password = "root"; # temp psswd
in {

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
    initrd.availableKernelModules = [ "xhci_pci" "usbhid" "usb_storage" ];
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = [ "noatime" ];
    };
  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  networking = {
    hostName = hostname;
    wireless = {
      enable = false;
      interfaces = [ interface ];
    };
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 ]; 
    };
  };

  environment.systemPackages = with pkgs; [
    git
    fd
    vim
    k3s
    helm
    kustomize
    curl
  ];

  services.openssh.enable = true;

  users = {
    mutableUsers = false;
    users."${username}" = {
      isNormalUser = true;
      password = password;
      extraGroups = [ "wheel" ];
    };
  };

  hardware.enableRedistributableFirmware = true;
  system.stateVersion = "23.11";
}
