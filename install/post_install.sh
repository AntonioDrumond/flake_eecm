sudo cp ../flake.nix /etc/nixos/
sudo nixos-rebuild switch --flake /etc/nixos#nixos
