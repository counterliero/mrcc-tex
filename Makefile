FILENAME = mrcc

default:
	makeindex	$(FILENAME).nlo -s nomencl.ist -o $(FILENAME).nls
	pdflatex	$(FILENAME).tex
	bibtex		$(FILENAME)
	makeindex	$(FILENAME).nlo -s nomencl.ist -o $(FILENAME).nls
	pdflatex	$(FILENAME).tex
	bibtex		$(FILENAME)
	pdflatex	$(FILENAME).tex

thumb:
	thumbpdf --compress=9 $(FILENAME)

opt:
	pdlin -perm csa $(FILENAME).pdf $(FILENAME).pdf 

clean: default
	rm -Rf *.lo* *.ilg  *.aux *.lof *.toc *.lot ./*~ *.mtc* *.ind *.g* *.out *blg *.bbl
cleanall: clean
	rm -Rf *.dvi *.ps *.bmt
