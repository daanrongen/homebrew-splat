# homebrew-splat

[Homebrew](https://brew.sh) tap for [`splat`](https://github.com/daanrongen/splat). Apple Silicon macOS only.

```sh
brew trust daanrongen/splat
brew install daanrongen/splat/splat
```

`Formula/splat.rb` installs splat's standalone bundle (`splat-<version>-macos-arm64.tar.gz`), which carries its own Python, so the formula has no dependencies. On each splat release, splat's publish workflow sends a `release` dispatch, and [`update.yml`](.github/workflows/update.yml) points the formula at the new bundle, installs and tests it, and commits. Edit the formula by hand only for changes other than url, version and sha256.
