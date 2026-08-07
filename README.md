# How to install these configs

### Install Homebrew packages
```
brew bundle
```

### To create symlinks with gnu stow
```
stow dots
```

### To automatically remove and then re-create the symlinks with gnu stow
```
stow -R dots
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