#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="archlinux-baseline-persistent"
iso_label="ARCH_PERSISTENT_$(date +%Y%m)"
iso_publisher="Arch Linux <https://archlinux.org>, Pellegrino Prevete <pellegrinoprevete@gmail.com>, Mark Beloglazov <justaguy3331@gmail.com>"
iso_application="Arch Linux baseline persistent"
iso_version="$(date +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr'
           'bios.syslinux.eltorito'
	   'uefi-ia32.grub.esp'
           'uefi-ia32.grub.eltorito'
           'uefi-x64.systemd-boot.esp'
           'uefi-x64.systemd-boot.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="erofs"
airootfs_image_tool_options=('-zlz4hc,12' -E ztailpacking)
# Setting encryption_key to `"auto"' will auto-generate the key.
# Leaving the variable empty will prompt the user for the key.
encryption_key="./keyfile"
# Persistent space in kilobytes (KB)
# Minimal persistent_size to fix the first problem: 16748
# Setting it lower causes the following errors:
#
# [ kernel/dmsg time] device-mapper: table: 254:0: integrity: Could not initialize superblock (-EINVAL)
# [ kernel/dmsg time] device-mapper: ioctl: error adding target to table
# device-mapper: reload ioctl on temporary-cryptsetup-XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX (254:0) failed: Invalid argument
# Cannot format integrity for device $(workdir)/persistent.ext4
#
# X means 16-bit number
# $(workdir) is full path to the directory your mkarchiso will work at

# Minimal persistent_size to fix the second problem: ≈50000 or ≈60000
# If 16748=<persistent_size=<50000 then you will see the following error:
# dd: /dev/mapper/persistent.ext4.map: No space left on device
persistent_size=100000
keys_image_type="erofs"
keys_image_tool_options=('-zlz4hc,12' -E ztailpacking)
file_permissions=(
  ["/etc/shadow"]="0:0:400"
)
