
files = $(wildcard *.el)
elc_files = $(files:.el=.elc)

all: $(elc_files)

%.elc: %.el
	emacs --batch -L . -q --eval '(byte-compile-file "$<")'

