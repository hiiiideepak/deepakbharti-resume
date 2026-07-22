TEX = deep_resume-openfont.tex
PDF = deep_resume-openfont.pdf

.PHONY: all clean

all: $(PDF)

$(PDF): $(TEX) deep-resume-openfont.cls
	xelatex -interaction=nonstopmode $(TEX)
	xelatex -interaction=nonstopmode $(TEX)

clean:
	rm -f *.aux *.log *.out $(PDF)
