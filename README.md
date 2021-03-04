# icd

Powerful `cd` command with fuzzy-search tool.

It's similar with [enhancd](https://github.com/b4b4r07/enhancd), but faster and more lightweight.

![](./demo.webp)

## Requirements

First, you need to install a fuzzy-search tool. We support:

- [fzy](https://github.com/jhawthorn/fzy) (recommended)
- [fzf](https://github.com/junegunn/fzf)

You just need to install one of them.

Second, you need to install a grep tool. We support:

- [ripgrep](https://github.com/BurntSushi/ripgrep) (recommended)
- grep (available in most OSes)

You just need to install one of them.

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
