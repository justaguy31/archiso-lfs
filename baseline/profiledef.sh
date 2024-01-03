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
encryption_key=1234
# Persistent space in kilobytes (KB)
# 30GB set as a test
# Minimal persistent_size allowed: 16748
persistent_size=16748
keys_image_type="erofs"
keys_image_tool_options=('-zlz4hc,12' -E ztailpacking)
file_permissions=(
  ["/etc/shadow"]="0:0:400"
)
