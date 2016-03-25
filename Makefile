CASK        ?= cask
EMACS       ?= emacs
DIST        ?= dist
EMACSFLAGS   = --batch -Q
EMACSBATCH   = $(EMACS) $(EMACSFLAGS)

VERSION     := $(shell EMACS=$(EMACS) $(CASK) version)
PKG_DIR     := $(shell EMACS=$(EMACS) $(CASK) package-directory)
PROJ_ROOT   := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
USER_ELPA_D  = ~/.emacs.d/elpa

SRC = scala-errors.el

.PHONY: all test install uninstall reinstall clean-all clean

all : $(PKG_DIR)

install : $(PKG_DIR)
	$(EMACSBATCH) -l package -f package-initialize \
	--eval '(package-install-file "$(SRC)")'

uninstall :
	rm -rf $(USER_ELPA_D)/scala-errors-*

reinstall : clean uninstall install

clean-all : clean
	rm -rf $(PKG_DIR)

clean :
	rm -f *.elc
	rm -f *-pkg.el

test: $(PKG_DIR)
	$(CASK) exec ert-runner

$(PKG_DIR) :
	$(CASK) install
