DOC = README.md
DOC += tools/URLs.md

docs/index.html: $(DOC) Makefile
	pandoc -f markdown -t html -s --toc -o $@ $(DOC)