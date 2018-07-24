# myrddin-kak

**WARNING:** This project is very new and experimental. Use at your own risk.

[Kakoune](http://github.com/mawww/kakoune) syntax highlighting and simple tools for [Myrddin](https://myrlang.org).

## Installation

```bash
git clone https://github.com/whereswaldon/myrddin-kak
ln -sv $PWD/kakdown/myrddin.kak ~/.config/kak/autoload/
```

**Note:** If this is your first time installing a Kakoune plugin and you don't already
have a `~/.config/kak/autoload/` folder, I recommend following these steps to create
it:

```bash
mkdir -p ~/.config/kak/autoload/
ln -sv $(dirname $(which kak))/../share/kak/autoload ~/.config/kak/autoload/system
```

If you don't symlink the system-wide `autoload` folder, all of the default Kakoune
commands will not be available next time you start your editor.

## Commands

No commands are currently exported. We'll get there...

## Configuration

Currently, nothing in this project needs configuration. Myrddin files should
be highlighted automatically.

## Todo

- [ ] Add highlighters for more advanced syntax constructs
- [ ] Add options/hooks/commands for automatic completion of certain structures

## Contribute

Feature requests and pull requests welcome!

## License

Unlicense

