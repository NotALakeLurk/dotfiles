# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config
, lib
, pkgs
, modulesPath
, ...
}: rec {
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/c0ef396c-a53e-414e-be58-cf80da13e993";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-6a5a0ecb-214e-48b7-8f57-0260a68512de".device = "/dev/disk/by-uuid/6a5a0ecb-214e-48b7-8f57-0260a68512de";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/86B4-BE07";
    fsType = "vfat";
  };

  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 16 * 1024;
  }];
  boot.resumeDevice = fileSystems."/".device;
  boot.kernelParams = [ "mem_sleep_default=deep" "resume_offset=3076096" "psmouse.synaptics_intertouch=0" ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
}
