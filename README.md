# KADEBOOT

An unofficial **stripped-down version** of the official archinstall that **is aimed for Desktop/KDE Plasma**.

This is a modified version (fork) of [archinstall](https://github.com/archlinux/archinstall), originally developed by the Arch Linux team.

Perfect for users who know they want KDE and it's dependencies (NetworkManager and Pipewire). 

## Installation

Boot Arch Linux Live ISO, get internet access, then:

```bash
pacman -Sy --noconfirm git python-cryptography && git clone https://github.com/h8d13/KADEBOOT.git
cd KADEBOOT && sudo ./install.sh
```

The dependancy `python-cryptography` is used in LUKS encryption module for Disks section. 
