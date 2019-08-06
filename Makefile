DOC = README.md
DOC += doc/about.md doc/install.md
DOC += tools/URLs.md
DOC += doc/ATM7029.md

docs/index.html: $(DOC) Makefile
	pandoc -f markdown -t html -s --toc -o $@ $(DOC)
	
TODAY = $(shell date +%y%m%d)
release:
	git push -v && git tag $(TODAY) && git push --tags
