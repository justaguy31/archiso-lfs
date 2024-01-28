echo "Setting up NetworkManager..."
systemctl enable NetworkManager.service
systemctl start NetworkManager.service
echo "Initializing pacman..."
echo "If it fails, run nmtui or nmcli for some manual configuration, such as entering password for your Wi-Fi router."
echo "When you're done, run 'systemctl start pacman-init.service' in order to rerun pacman initialization."
systemctl start pacman-init.service
