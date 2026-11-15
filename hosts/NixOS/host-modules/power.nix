{ ... }:
{
    powerManagement.enable = true;
    services.tuned.enable = true;

    services.logind.settings.Login = {
        HandleLidSwitch = "suspend-then-hibernate";
        HandlePowerKey = "hibernate";
        HandlePowerKeyLongPress = "poweroff";
    };

    systemd.sleep.settings.Sleep.HibernateDelaySec = "30min";

    boot.resumeDevice = "/dev/disk/by-uuid/629066f5-060d-4a7f-a09d-1768c0c0fc41";
    security.pam.services.hyprlock = {};
}
