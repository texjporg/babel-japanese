# Makefile for babel-japanese
# Note that all files are UTF-8 (without BOM) encoded!

STRIPTARGET = japanese.ldf babel-japanese-sample.tex
PDFTARGET = babel-japanese.pdf babel-japanese-sample.pdf \
	japanese.pdf
DVITARGET = babel-japanese.dvi babel-japanese-sample.dvi
KANJI = -kanji=utf8
FONTMAP = -f haranoaji.map -f ptex-haranoaji.map
TEXMF = $(shell kpsewhich -var-value=TEXMFHOME)

default: $(STRIPTARGET) $(DVITARGET)
strip: $(STRIPTARGET)
all: $(STRIPTARGET) $(PDFTARGET)

japanese.ldf: babel-japanese.dtx
	platex $(KANJI) babel-japanese.ins

babel-japanese.dvi: babel-japanese.dtx
	platex $(KANJI) babel-japanese.dtx
	platex $(KANJI) babel-japanese.dtx

japanese.pdf: japanese.tex
	lualatex japanese.tex
	lualatex japanese.tex
	lualatex japanese.tex

.SUFFIXES: .tex .dvi .pdf
.tex.dvi:
	platex $(KANJI) $<
	platex $(KANJI) $<
.dvi.pdf:
	dvipdfmx $(FONTMAP) $<

.PHONY: clean
clean:
	rm -f *.aux *.log *.out *.toc \
	japanese.ldf \
	babel-japanese-sample.tex \
	*.dvi *.pdf
