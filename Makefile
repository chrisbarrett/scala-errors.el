CASK        ?= cask
EMACS       ?= emacs
EMACSFLAGS  = --batch -Q
EMACSBATCH  = $(EMACS) $(EMACSFLAGS)

CASK_PKG_DIR := $(shell EMACS=$(EMACS) $(CASK) package-directory)
USER_ELPA_D  = ~/.emacs.d/elpa

SRC = scala-errors.el

.PHONY: all test install uninstall reinstall clean-all clean

all : $(CASK_PKG_DIR)

install : $(CASK_PKG_DIR)
	$(EMACSBATCH) -l package -f package-initialize \
	--eval '(package-install-file "$(SRC)")'

uninstall :
	rm -rf $(USER_ELPA_D)/scala-errors-*

reinstall : clean uninstall install

clean-all : clean
	rm -rf $(CASK_PKG_DIR)

clean :
	rm -f *.elc
	rm -f *-pkg.el

test: $(CASK_PKG_DIR)
	$(CASK) exec ert-runner

$(CASK_PKG_DIR) :
	$(CASK) install
