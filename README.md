# KADEBOOT

<img width="2000" height="1125" alt="image" src="https://github.com/user-attachments/assets/1de805c4-26f9-4071-9491-88d077decfd7" />

----

An unofficial **stripped-down version** of the official archinstall that **is aimed for Desktop/KDE Plasma**.

This is a modified version (fork) of [archinstall](https://github.com/archlinux/archinstall), originally developed by the Arch Linux team.

Perfect for users who know they want KDE and it's dependencies **(NetworkManager, Pipewire, and SDDM)**. 

## Installation

Boot Arch Linux Live ISO (using f10, f12 or del), get internet access, then:
- No secureboot or set to `other OS`

```bash
pacman -Sy --noconfirm git python-cryptography
git clone https://github.com/h8d13/KADEBOOT

cd KADEBOOT && ./install
```

> The dependancy `python-cryptography` is used in LUKS encryption module for Disks section. ALso needs `python-pyparted` and `python-pydantic` but these are included in official Arch ISO. 

## After initial install

You will have 3 options: Chroot, Reboot or exit. Pick reboot.

Go to BIOS again to **switch to hard disk.** And login this ugly SDDM screen using user you created earlier:

<img width="1200" height="675" alt="image" src="https://github.com/user-attachments/assets/c747de21-e1bb-4efc-9959-365b171a49c7" />

---
Open the apps launcher > type `Konsole` 
> I've taken the liberty to clone the other repo in sudo user 0's home. 

```
cd KAES-ARCH/
``` 
Edit the targets: user and kb using editor of your choice.

Example: `sudo vim post` or `sudo nano post`

```
DTHEME=dark
KB_LAYOUT=us
VARIANT=""
```
> Variant is optional, can be left empty. Applies for the current sudo user by default. Do check out some of the parts that you can configure (additional packages, removing stuff, guest account, etc). 

Then run: `sudo ./post`

After running the script it will restart one last time. **And you are done !**

You should now see this beauty instead. 

<img width="1281" height="823" alt="image" src="https://github.com/user-attachments/assets/f06fe936-4ddf-44a9-a118-87f220f6ed6e" />

---

For more info see main repo: [KAES-ARCH](https://github.com/h8d13/KAES-ARCH)

Boot ISO → Run KADEBOOT → Reboot → Run KAES-ARCH post script → Use PACTOPAC for ongoing management if needed (or use command line if preferred). 

## Modifications

- Hybrid setup detection (common case of Nvidia-Intel) in `hardware.py`
- Stripped a lot of code for defaults to be simpler. And for display.
- Simplified heavily for KDE specifics. 
