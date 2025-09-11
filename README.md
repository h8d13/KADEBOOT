# KADEBOOT

A **stripped-down version** of the official archinstall that **only supports Desktop/KDE Plasma**.

This is a modified version (fork) of [archinstall](https://github.com/archlinux/archinstall), originally developed by the Arch Linux team.

Perfect for users who know they want KDE and it's dependencies (NetworkManager and Pipewire). 

## Installation

Boot Arch Linux Live ISO, get internet access, then:

```bash
# Install dependencies (others included in ISO)
sudo pacman -Sy git python-cryptography
# Clone repo and move inside it
git clone https://github.com/h8d13/KADEBOOT.git
cd KADEBOOT

# Run
sudo ./install.sh
```

The dependancy python-cryptography is used in LUKS encryption module for Disks section. 
