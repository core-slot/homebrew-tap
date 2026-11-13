# core-slot/homebrew-tap

Homebrew formulae for [coreslot](https://github.com/core-slot/coreslot).

```sh
brew install core-slot/tap/coreslot
brew install --cask core-slot/tap/coreslot-menubar
```

The formula builds from the tagged source archive. The cask installs the menu bar app, signed and
notarised, from its GitHub release. The app looks for coreslot 0.8.0 or later in `~/.local/bin`,
`/opt/homebrew/bin`, `/usr/local/bin` and its own `PATH`. If coreslot is installed elsewhere
(`go install` puts it in `~/go/bin`), choose the binary in the app's Settings.
