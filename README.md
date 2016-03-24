# scala-errors

## Summary

Quickly navigate to errors in a Scala project using [sbt-quickfix][].

## Installing

You will need Emacs 24+, `make` and [Cask](https://github.com/cask/cask) to
build the project.

    cd scala-errors
    make && make install

Call `(add-hook 'scala-mode-hook #'scala-errors-init)` at the end of your Emacs
configuration to improve integration with 3rd-party packages.

If you are a Spacemacs user, you can also call `(add-hook 'scala-mode-hook #'scala-errors-spacemacs-init)`
to add major-mode-specific leader key bindings in scala-mode.

## Contributing

Yes, please do! See [CONTRIBUTING][] for guidelines.

## License

See [COPYING][]. Copyright (c) 2016 Chris Barrett.


[CONTRIBUTING]: ./CONTRIBUTING.md
[COPYING]: ./COPYING
[sbt-quickfix]: https://github.com/dscleaver/sbt-quickfix
