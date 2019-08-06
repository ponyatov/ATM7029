DOC = README.md
DOC += tools/URLs.md

docs/index.html: $(DOC) Makefile
	pandoc -f markdown -t html -s --toc -o $@ $(DOC)
	
TODAY = $(shell date +%y%m%d)
release:
	git tag $(TODAY) && git push -v --tags
