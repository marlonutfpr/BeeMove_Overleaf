# Compilação local (fora do Overleaf): TeX Live medium + os pacotes que o
# template da Springer Nature e as figuras TikZ usam e que o medium não traz.
FROM texlive/texlive:latest-medium
RUN tlmgr install standalone bigfoot appendix xstring adjustbox collectbox \
        algorithms algorithmicx program lineno ncctools multirow \
        textcase enumitem sttools threeparttable breakurl wrapfig \
        apacite vruler hypcap
