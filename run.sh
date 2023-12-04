# !/bin/bash
# run.sh - the main script
# Copyright (C) 2023 Beloglazov Mark
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
# run.sh - главный скрипт
# Copyright © 2023 Beloglazov Mark
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

# -a[=options] --ask[=options]
# Set the level of importance for questions directed to the user
# for more control over the installation.

# -d[=options] --debug[=options]
# Set the level of printing debug information.
# Устанавливает уровень выведения отладочной информации на экран.
# options:
# a - print everything (выводить всё)
# b - only print current stage of installation (выводить только текущую стадию установки)
# v - "b" option with printing current script running, plus current Makefile recipe (опция "b", но ещё с выведением текущего скрипта в работе, а также текущего рецепта Makefile)
# j - "b" option with printing which sub-commands were invoked and when they exited (опция "b", но ещё с выведением вызовов сторонних программ и когда они завершились)
# n - print no debugging information (не выводить никакой отладочной информации)
