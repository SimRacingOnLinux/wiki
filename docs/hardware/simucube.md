# Simucube 1/2

Simucube wheelbases work out of the box on Linux. The following instructions are for setting up Simucube True Drive for configuration and customisation of the wheelbase settings.  
These docs are based off of [this post](https://granitedevices.com/wiki/Using_Simucube_wheel_base_in_Linux) on the Simucube wiki which itself is based on [this post](https://community.granitedevices.com/t/simucube-2-on-linux/10166) on the Simucube forums.  

Install wine.  
Download the latest version of Simucube True Drive (Note: not Simucube Tuner, currently Tuner doesn't work on Linux). Given that True Drive is no longer under development that will most likely be [2024.7.1 hotfix](https://granitedevices.com/w/images/a/a7/Simucube_2_True_Drive_2024.7.1.zip).  
Extract the downloaded zip. `unzip Simucube_2_True_Drive_2024.7.1.zip`
Create a folder to contain your wine prefix, for these docs I will be using `/home/username/wine/simucube` but you are free to substitute your own path (make sure to use your own username).  
`mkdir /home/username/wine/simucube`

Add the following udev rules:
`sudo nano /etc/udev/rules.d/72-simucube.rules`

```
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

Run `sudo udevadm --reload && sudo udevadm trigger` to apply those new rules.  

Now we need to change some registries to disable SDL and Input in Wine.  
`WINEPREFIX="/home/username/wine/simucube" wine reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\winebus" /v "Enable SDL" /t REG_DWORD /d 0`  
`WINEPREFIX="/home/username/wine/simucube" wine reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\winebus" /v DisableInput /t REG_DWORD /d 1`  

At this point we can run the installer for True Drive.
`WINEPREFIX="/home/username/wine/simucube" wine Simucube\ 2\ True\ Drive\ 2024.7.1.exe`  
Once the installer is complete you can run True Drive using the following command
`WINEPREFIX=/home/username/wine/simucube wine /home/username/wine/simucube/drive_c/Program\ Files/Simucube\ 2\ True\ Drive/Simucube\ 2\ True\ Drive\ Paddock.exe`.  

I would personally recommend making an alias for that command to save you typing it every time you want to change your FFB, you could also make a .desktop file to open it from an app launcher.
