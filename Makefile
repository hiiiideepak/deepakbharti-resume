TEX = deep_resume-openfont.tex
PDF = deep_resume-openfont.pdf

# MacTeX installs xelatex here; BasicTeX uses the same path after `sudo tlmgr install collection-fontsrecommended`
export PATH := /Library/TeX/texbin:/usr/local/texlive/2025/bin/universal-darwin:/usr/local/texlive/2024/bin/universal-darwin:$(PATH)
XELATEX := $(shell command -v xelatex 2>/dev/null)

.PHONY: all clean

all: $(PDF)

$(PDF): $(TEX) deep-resume-openfont.cls
ifndef XELATEX
	@echo "ERROR: xelatex not found."
	@echo "Install MacTeX: https://www.tug.org/mactex/"
	@echo "Or BasicTeX + fonts: brew install --cask basictex && sudo tlmgr install collection-fontsrecommended fontspec enumitem titlesec"
	@exit 1
endif
	$(XELATEX) -interaction=nonstopmode $(TEX)
	$(XELATEX) -interaction=nonstopmode $(TEX)

clean:
	rm -f *.aux *.log *.out *.synctex.gz $(PDF)
