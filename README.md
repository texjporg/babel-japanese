# babel-japanese

The package "babel-japanese" (or shortly, "japanese" package) provides
`japanese` option for Babel package. It defines all the language
definition macros in Japanese.

Currently this package works on pLaTeX, upLaTeX, XeLaTeX and LuaLaTeX.


## Limitations

Note that this package is not perfect: the word order in Japanese is
different from that in most Western languages including English, so
the words like "Part" or "Chapter" cannot be replaced with Japanese
counterpart. This limitation is due to the design of classes.dtx
(article.cls etc), which has \chaptername in front of the numbering
but no sequence behind the number.

The common Japanese classes including (u)jclasses in (u)pLaTeX,
jsclasses, ltj(s)classes in LuaTeX-ja are well-supported.


## Installation

1) Process babel-japanese.ins with some tex engine.
For example, using lualatex:

        lualatex babel-japanese.ins

When you use platex, give -kanji=utf8 option.

        platex -kanji=utf8 babel-japanese.ins

You will get japanese.ldf (the main code) and
babel-japanese-sample.tex (sample document for pLaTeX).

2) Process documentation, babel-japanese.dtx and
babel-japanese-sample.tex, as you wish.
babel-japanese.dtx can be processed with pLaTeX, upLaTeX or LuaLaTeX.
babel-japanese-sample.tex is written for pLaTeX or LuaLaTeX.

If you use lualatex:

        lualatex babel-japanese.dtx
        lualatex babel-japanese-sample.tex

If you use platex:

        platex -kanji=utf8 babel-japanese.dtx
        dvipdfmx babel-japanese.dvi
        platex -kanji=utf8 babel-japanese-sample.tex
        dvipdfmx babel-japanese-sample.dvi

3) Deploy the directory or files in an appropriate place under the TEXMF tree.

        * japanese.ldf
               => $TEXMF/tex/generic/babel-japanese/
        * babel-japanese.dtx
               => $TEXMF/source/generic/babel-japanese/
        * babel-japanese.pdf, babel-japanese-sample.tex, babel-japanese-sample.pdf
               => $TEXMF/doc/generic/babel-japanese/

4) Execute mktexlsr.


## Repository

The bundle is maintained on GitHub:
  https://github.com/texjporg/babel-japanese

If you have issues, please let us know from the above page.


## License

Copyright (C) 1999-2007 by ING (Toru Inagaki)
Copyright (C) 2016-     by Japanese TeX Development Community

This package is free software that can be redistributed and/or
modified under the terms of the LaTeX Project Public License 1.3.


## Release Date

$RELEASEDATE

Japanese TeX Development Community
