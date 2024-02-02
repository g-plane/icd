# icd

Powerful `cd` command with fuzzy-search tool.

It's similar with [enhancd](https://github.com/b4b4r07/enhancd), but faster and more lightweight.

![](./demo.webp)

## Requirements

First, you need to install [fzf](https://github.com/junegunn/fzf) for fuzzy searching.

Second, you can install [ripgrep](https://github.com/BurntSushi/ripgrep).
This is optional, but recommended. If don't have ripgrep, you can set `$ICD_GREP` to `grep` like this:

```sh
export ICD_GREP=grep
```

icd will fall back to use `grep` command instead of `rg`.

## Install

### Oh My Zsh

Run this command:

```
git clone https://github.com/g-plane/icd.git $ZSH_CUSTOM/plugins
```

Then, update your `.zshrc` like this:

```diff
plugins=(
  # ... your other plugins
+ icd
)
```

### zinit

Update your `.zshrc` with following line:

```sh
zinit light g-plane/icd
```

### zplug

Update your `.zshrc` with following line:

```sh
zplug "g-plane/icd"
```

## License

MIT License

2020-present (c) Pig Fang
