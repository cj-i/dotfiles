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