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
encryption_key="auto"
persistent_size=10000
keys_image_type="erofs"
keys_image_tool_options=('-zlz4hc,12' -E ztailpacking)
file_permissions=(
  ["/etc/shadow"]="0:0:400"
)
