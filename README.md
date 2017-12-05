# dotfiles

## 下準備
```
$ xcode-select --install
```

## Usage
```
$ cd
$ bash -c "$(curl -fsSL raw.github.com/ruwatana/dotfiles/master/setup)" -- initialize
$ ./setup deploy
```

Or

```
$ cd
$ git clone https://github.com/ruwatana/dotfiles.git
```

### Initialize OS X (install)
```
$ ./setup initialize
```

### Deploy dotfiles (create symbolic links)
```
$ ./setup deploy
```

