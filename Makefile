# Makefile for babel-japanese
# Note that all files are UTF-8 (without BOM) encoded!

STRIPTARGET = japanese.ldf japanese-sample.tex
PDFTARGET = japanese.pdf japanese-sample.pdf
DVITARGET = japanese.dvi japanese-sample.dvi
KANJI = --kanji=utf8
FONTMAP = -f ptex-ipaex.map -f ipaex.map

default: $(STRIPTARGET) $(DVITARGET)
strip: $(STRIPTARGET)
all: $(STRIPTARGET) $(PDFTARGET)

japanese.ldf: japanese.dtx
	platex $(KANJI) japanese.ins

japanese.dvi: japanese.dtx
	platex $(KANJI) japanese.dtx
	platex $(KANJI) japanese.dtx

.SUFFIXES: .tex .dvi .pdf
.tex.dvi:
	platex $(KANJI) $<
	platex $(KANJI) $<
.dvi.pdf:
	dvipdfmx $(FONTMAP) $<

.PHONY: clean
clean:
	rm -f \
	japanese.ldf japanese-sample.tex \
	japanese.pdf japanese-sample.pdf
