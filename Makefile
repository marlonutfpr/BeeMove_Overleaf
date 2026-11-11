# Compilação local com Docker (o Overleaf compila o main.tex sozinho).
#   make          -> figuras + main.pdf
#   make figures  -> só as figuras TikZ (figures/FigN.tex -> figures/FigN.pdf)
IMG := beemove-paper-tex
RUN := docker run --rm -v "$(CURDIR)":/w -w /w $(IMG)
FIGS := $(patsubst %.tex,%.pdf,$(wildcard figures/Fig*.tex))

all: main.pdf

image:
	docker build -q -t $(IMG) tools

figures/%.pdf: figures/%.tex
	$(RUN) sh -c 'cd figures && pdflatex -interaction=nonstopmode -halt-on-error $*.tex >/dev/null && rm -f $*.aux $*.log'

figures: $(FIGS)

main.pdf: main.tex references.bib $(FIGS)
	$(RUN) sh -c 'pdflatex -interaction=nonstopmode main.tex >/dev/null; bibtex main >/dev/null; pdflatex -interaction=nonstopmode main.tex >/dev/null; pdflatex -interaction=nonstopmode -halt-on-error main.tex >/dev/null'
	@grep -E "^!|Citation .* undefined|Reference .* undefined" main.log || echo "main.pdf ok"

todos:
	@grep -o '\\todo{[^}]*}\|\\result{[^}]*}' main.tex | wc -l | xargs echo "TODO/RESULT pendentes:"

clean:
	rm -f *.aux *.bbl *.blg *.log *.out main.pdf figures/*.aux figures/*.log

.PHONY: all image figures todos clean
