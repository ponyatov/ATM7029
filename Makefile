
install: doc tools

DOC = README.md
DOC += doc/about.md doc/devices.md doc/install.md
DOC += tools/URLs.md
DOC += doc/ATM7029.md doc/GS702A.md doc/Vivante.md
DOC += doc/Android.md

doc: docs/index.html
docs/index.html: $(DOC) Makefile
	pandoc -f markdown -t html -s --toc -o $@ $(DOC)
	
tools: \
	tools/ACTIONS\ Pad\ Product\ Tool_V1.09.02.rar \
	tools/ACTIONS\ Pad\ Firmware\ Modify\ Tool_V1.16.rar
	
tools/ACTIONS\ Pad\ Product\ Tool_V1.09.02.rar:
	wget -c -O "$@" https://github.com/ponyatov/ATM7029/releases/download/190806/ACTIONS.Pad.Product.Tool_V1.09.02.rar
tools/ACTIONS\ Pad\ Firmware\ Modify\ Tool_V1.16.rar:
	wget -c -O "$@" https://github.com/ponyatov/ATM7029/releases/download/190806/ACTIONS.Pad.Firmware.Modify.Tool_V1.08.rar
	
TODAY = $(shell date +%y%m%d)
release:
	git push -v && git tag $(TODAY) && git push --tags

merge:
	git checkout master
	git checkout ponyatov -- Makefile doc
	$(MAKE) doc
