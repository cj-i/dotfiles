# How to install these configs

### To pull all git subfolder
```
git submodule update --init --recursive
```

### To remove local files for all git submodules
```
git submodule deinit --all
```

### Install Homebrew packages
```
brew bundle
```

### To create symlinks with gnu stow
```
stow .
```

### To automatically remove and then re-create the symlinks with gnu stow
```
stow -R .
```

### To delete symlinks with gnu stow
```
stow -D .
```

### To find symlinks in the current directory
```
find . -type l
```

### To delete all symlinks in the current directory
```
find . -type l -delete
```

### To delete a symlinked file by name in the current directory
```
find . -name ".stowrc" -delete
```