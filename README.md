# KADEBOOT

<img width="2000" height="1125" alt="image" src="https://github.com/user-attachments/assets/1de805c4-26f9-4071-9491-88d077decfd7" />

----

An unofficial **stripped-down version** of the official archinstall that **is aimed for Desktop/KDE Plasma**.

This is a modified version (fork) of [archinstall](https://github.com/archlinux/archinstall), originally developed by the Arch Linux team.

Perfect for users who know they want KDE and it's dependencies **(NetworkManager, Pipewire, and SDDM)**. 

## Installation

**Pre-req:** 1 USB (minimum 2GB), 1 target Drive (minimum 16GB). 

Boot Arch Linux Live ISO (using f10, f12 or del), get internet access, then:
- No secureboot or set to `other OS`

```bash
pacman -Sy git python-cryptography
git clone https://github.com/h8d13/KADEBOOT

cd KADEBOOT && ./install
```

> The dependancy `python-cryptography` is used in LUKS encryption module for Disks section. Also needs `python-pyparted` and `python-pydantic` but these are included in official Arch ISO. 

## After initial install

You will have 3 options: Chroot, Reboot or exit. Pick reboot.

Go to BIOS again to **switch to hard disk.** 

---

Login this ugly SDDM screen using user you created earlier (you will only see this once!)

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


## KADEBOOT under the hood

### Solving problems one by one

- Misconfiguration of a single thing in archinstall results in KDE not working as intended > This fork [KADEBOOT](https://github.com/h8d13/KADEBOOT)
- Many defaults on KDE are icky by default for desktop/laptop usage > Post script [KAES-ARCH](https://github.com/h8d13/KAES-ARCH)
- Don't know how to use my system (gaming, flathub, etc) > GUI package man + Settings [PACTOPAC](https://github.com/h8d13/PACTOPAC)

This combines all 3 repos into a single TUI and 5 extra commands (see above). 

### Flow

**Boot ISO** → Run KADEBOOT (Archinstall but modified for KDE) → **Reboot** → (Clones for you) KAES-ARCH → Run post script (Many improvements to defaults) → (Clones for you) PACTOPAC →  **Reboot** → Use PACTOAPC settings page to quickly setup → **Normal usages** → Use PACTOPAC for ongoing management if needed (or use command line if familiar).

> This set-up with a rolling release is ideal because we have single sources of truth for each critical aspect. Also I like to keep my work on the side and be able to brick an install if needed in 15 minutes. 
But it's all handled from here automatically you wont need to do much but follow the instructions above and pick desired values.

We can also easily allow for self-upgrades by simply running `git pull` for example (especially for package manager or any added features). 

### Modifications

- Hybrid setup detection (common case of Nvidia-Intel) in `hardware.py`
- Stripped a lot of code for defaults to be simpler. And for display.
- Simplified heavily for KDE specifics. 
- Logging inside dir
- Auto-save/Load configs
