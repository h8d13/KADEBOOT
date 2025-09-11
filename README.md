# KADEBOOT

An unofficial **stripped-down version** of the official archinstall that **is aimed for Desktop/KDE Plasma**.

This is a modified version (fork) of [archinstall](https://github.com/archlinux/archinstall), originally developed by the Arch Linux team.

Perfect for users who know they want KDE and it's dependencies (NetworkManager and Pipewire). 

## Installation

Boot Arch Linux Live ISO (using f10, f12 or del), get internet access, then:
- No secureboot or set to `other OS`

```bash
pacman -Sy --noconfirm git python-cryptography
git clone https://github.com/h8d13/KADEBOOT

cd KADEBOOT && sudo ./install
```

> The dependancy `python-cryptography` is used in LUKS encryption module for Disks section. 

## Modifications

- Hybrid setup detection (common case of Nvidia-Intel) in `hardware.py`
- Stripped a lot of code for defaults to be simpler. And for display.

## After initial install

You will have 3 options: Chroot, Reboot or exit. Pick exit.

Go to BIOS again to switch to disk. And login this ugly SDDM screen using user you created earlier:

<img width="1200" height="675" alt="image" src="https://github.com/user-attachments/assets/c747de21-e1bb-4efc-9959-365b171a49c7" />

---

Open the apps launcher > type `Konsole` 

```
git clone https://github.com/h8d13/KAES-ARCH
cd KAES-ARCH/
``` 
Edit the targets: user and kb using editor of your choice.

Example: `sudo vim post` or `sudo nano post`
```
DTHEME=dark
KB_LAYOUT=us
VARIANT=""
```

> Variant is optional, can be left empty. Applies for the current sudo user by default.

Then run: `chmod +x post && sudo ./post`

After our script it will restart one last time. And you are done !


