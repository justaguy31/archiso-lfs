echo "Setting up NetworkManager..."
systemctl enable NetworkManager.service
systemctl start NetworkManager.service
echo "Initializing pacman..."
echo "If it fails, run nmtui or nmcli for some manual configuration, such as entering password for your Wi-Fi router."
echo "When you're done, run 'systemctl start pacman-init.service' in order to rerun pacman initialization."
systemctl start pacman-init.service
# I have some big trouble modifying this because I have Windows 10,
# so I'm just gonna leave this here.
# archiso-lfs won't be living long anyways
# as I want it to be replaced with an actual installation image of future LinuxHome distribution.
chmod a+rwx /usr/local/bin/lfs-install
# The system being a weirdo
echo "Updating CA certificates..."
update-ca-certificates