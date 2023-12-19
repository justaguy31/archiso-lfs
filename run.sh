# !/bin/bash
# run.sh - initialization plus formatting the internal storage
# Copyright (C) 2023 Beloglazov Mark <justaguy3331@gmail.com>
#
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of  MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# this program.  If not, see <http://www.gnu.org/licenses/>.
#
# run.sh - инициализация и форматирование внутреннего носителя
# Copyright © 2023 Beloglazov Mark <justaguy3331@gmail.com>
#
# Эта программа является свободным программным обеспечением: Вы можете
# распространять ее и (или) изменять, соблюдая условия Генеральной Публичной
# Лицензии GNU, опубликованной Фондом Cвободного Программного Обеспечения; либо
# редакции 3 Лицензии, либо (на Ваше усмотрение) любой редакции, выпущенной позже.
#
# Эта программа распространяется в расчете на то, что она окажется полезной, но
# БЕЗ КАКИХ-ЛИБО ГАРАНТИЙ, включая подразумеваемую гарантию КАЧЕСТВА либо
# ПРИГОДНОСТИ ДЛЯ ОПРЕДЕЛЕННЫХ ЦЕЛЕЙ. Ознакомьтесь с Генеральной публичной
# лицензией GNU для получения более подробной информации.
#
# Вы должны были получить копию Генеральной Публичной Лицензии GNU вместе с этой
# программой. Если Вы ее не получили, то перейдите по адресу:
# <http://www.gnu.org/licenses/>. 

# -a[=var] --ask[=var]
# var:
# a - everything
# n - nothing

# -d[=var] --debug[=var]
# a - print everything (выводить всё)
# b - only print current stage of installation (выводить только текущую стадию установки)
# v - print which scripts and Makefile recipes were invoked and when they exited
# j - print which sub-commands were invoked and when they exited
# p - print which directories were invoked and when they were exited
# n - print no debugging information (не выводить никакой отладочной информации)

# -h --help
usage=''

# -i --ignore-warnings

# -k --keep-going
# A potentially sadistic option

# -s[=var] --save-file[=var]
# Note that this works only if your internal storage is complete.
# If not, the script will store the var and wait.
# Стоить подметить, что опция работает только если внутренний носитель завершён.
# Если нет, то скрипт сбережёт var на потом и станет ждать.

# -S --stop
# Cancels the -k option. Might be used in user-created scripts?

# -l --license

echo '
run.sh Copyright (C) 2023 Beloglazov Mark <justaguy3331@gmail.com>

This program comes with ABSOLUTELY NO WARRANTY;
for details use `-l` or `--license` options.
This is free software, and you are welcome to redistribute it
under certain conditions; use `-l` or `--license` options for details.

Эта программа поставляется БЕЗ КАКИХ-ЛИБО ГАРАНТИЙ;
для подробной информации используйте параметры `-l` или `--license`.
Это свободное программное обеспечение, Вы можете распространять его при соблюдении
определенных условий; для подробной информации используйте параметры `-l` или `--license`.'

error() {
  echo 'Error: ' $1
  exit 1
}

# Check whether the script is being run with sudo privileges
# Проверка наличия sudo привилегий
sudocheck=$(whoami)
case sudocheck in
  root)
    echo 'Running as sudo.'
  ;;
  *)
    error 'You must be running this script with sudo privileges.
Вы должны запускать данный скрипт с sudo привилегиями.'
  ;;
esac

#echo "Preparing the internal storage..."
#echo "Set partition sizes manually or automatically?"
echo 'Choose a device to format:'
lsblk
read -p 'Enter in the name of the device you`ve chosen
Введите название устройства, которое Вы выбрали:' devdisk
parteddevice='/dev/$devdisk'
partedsize=$(lsblk | grep '$devdisk')(?!)
# Partitioning the internal storage
# Разбиение внутреннего носителя на разделы
# https://wiki.archlinux.org/title/Partitioning
parted --script $parteddevice mktable gpt
parted --script $parteddevice mkpart lfs-swap linux-swap 1MiB 501MiB
parted --script $parteddevice mkpart lfs ext4 501 