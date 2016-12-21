BUILD_NAME=main

# source files
TEX_FILES=main.tex $(shell find tex/ -type f -name '*.tex')
BIB_FILES=$(shell find bib/ -type f -name '*.bib')

# Latex compiler settings
FLAG=-quiet -f -outdir=build/meta \
		 -pdf -pdflatex="pdflatex -interaction=errorstopmode" -use-make
LATEX=latexmk $(FLAG)


compile: build/$(BUILD_NAME).pdf
.PHONY: compile

clean:
	@rm -rf build
.PHONY: clean

build/$(BUILD_NAME).pdf: build/meta/main.pdf
	@cp $< $@

build/meta/main.pdf: $(TEX_FILES) $(BIB_FILES) build/meta
	@echo
	@$(LATEX) $<
	@echo

build/meta: build
	@mkdir -p build/meta

build:
	@mkdir -p build
