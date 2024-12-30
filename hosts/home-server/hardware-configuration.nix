# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "ahci" "ohci_pci" "ehci_pci" "pata_atiixp" "usb_storage" "ums_realtek" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/3ad1991b-5c45-4b14-9936-576a5ffeaf93";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-19549a60-da7e-44ed-ac48-25bef2852ff9".device = "/dev/disk/by-uuid/19549a60-da7e-44ed-ac48-25bef2852ff9";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/2B43-B128";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/75c53cd1-bd5a-44f0-a1a5-16d0d0d335dd"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp4s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}