echo "Setting up NetworkManager..."
systemctl enable NetworkManager.service
systemctl start NetworkManager.service
echo "Initializing pacman... May fail if additional configuration required."
systemctl start pacman-init.service
