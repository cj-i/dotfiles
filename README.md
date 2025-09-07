# How to install these configs

### Install Homebrew packages
```
brew bundle
```

### To create symlinks with gnu stow
```
stow dots
```

### To delete symlinks with gnu stow
```
stow -D dots
```

### To find symlinks in the current directory
```
find . -type l
```

### To find symlinks in the current directory
```
find . -type l -delete
```

### To apply local Nix Home Manager configuration to your system in your current directory
```
cd ./nix-config
```
```
nix run home-manager -- switch --flake .
```

### To apply the your `flake.nix` configuration found in your current directory
```
cd ./nix-config
```
```
home-manager switch --flake .
```