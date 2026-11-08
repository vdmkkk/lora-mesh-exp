LATEX ?= tectonic

.PHONY: article
article:
	mkdir -p build
	$(LATEX) --keep-logs -o build article.tex
