---
title: Simucube
---

## Setting up Simucube 2 True Drive

Simucube wheelbases work out of the box on Linux. The following instructions are for setting up Simucube True Drive for configuration and customisation of the wheelbase settings.
These docs are based off of [this post](https://granitedevices.com/wiki/Using_Simucube_wheel_base_in_Linux) on the Simucube wiki which itself is based on [this post](https://community.granitedevices.com/t/simucube-2-on-linux/10166) on the Simucube forums.

1. Install Wine.

2. Download the latest version of Simucube True Drive (Note: not Simucube Tuner, currently Tuner doesn't work on Linux). Given that True Drive is no longer under development that will most likely be [2024.7.1 hotfix](https://granitedevices.com/w/images/a/a7/Simucube_2_True_Drive_2024.7.1.zip).

3. Extract the downloaded zip: `unzip Simucube_2_True_Drive_2024.7.1.zip`

4. Create a folder to contain your Wine prefix, for these docs I will be using `$HOME/wine/simucube` but you are free to substitute your own path (make sure to use your own username).
```shell
mkdir $HOME/wine/simucube
```

5. Add the following udev rules to `/etc/udev/rules.d/72-simucube.rules`
```shell
#Simucube 1:
KERNEL=="hidraw*", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="0d5a", MODE="0660", TAG+="uaccess"

#Simucube 1 - firmware upgrade mode:
KERNEL=="hidraw*", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="0d5b", MODE="0660", TAG+="uaccess"

#Simucube 2 Sport:
KERNEL=="hidraw*", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="0d61", MODE="0660", TAG+="uaccess"

#Simucube 2 Pro:
KERNEL=="hidraw*", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="0d60", MODE="0660", TAG+="uaccess"

#Simucube 2 Ultimate:
KERNEL=="hidraw*", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="0d5f", MODE="0660", TAG+="uaccess"

#Simucube 2 (All models) - firmware upgrade mode:
KERNEL=="hidraw*", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="0d5e", MODE="0660", TAG+="uaccess"
```
> !!! note "Tip:"
    You can run `sudo nano /etc/udev/rules.d/72.simucube.rules` in a terminal to edit the file as root.

6. Run `sudo udevadm --reload && sudo udevadm trigger` to apply those new rules.

7. Now we need to change some registries to disable SDL and Input in Wine.
```shell
WINEPREFIX="$HOME/wine/simucube" wine reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\winebus" /v "Enable SDL" /t REG_DWORD /d 0
```
```shell
WINEPREFIX="$HOME/wine/simucube" wine reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\winebus" /v DisableInput /t REG_DWORD /d 1
```

8. At this point we can run the installer for True Drive.
```shell
WINEPREFIX="$HOME/wine/simucube" wine Simucube\ 2\ True\ Drive\ 2024.7.1.exe
```

9. Once the installer is complete you can run True Drive using the following command
```shell
WINEPREFIX=$HOME/wine/simucube wine $HOME/wine/simucube/drive_c/Program\ Files/Simucube\ 2\ True\ Drive/Simucube\ 2\ True\ Drive\ Paddock.exe
```

!!! Info "Recommendation:"
    Make an alias for the command to save you typing it every time you want to change your FFB, you could also make a .desktop file to open it from an app launcher.
