###############################################################################
#
# 	Makefile for my master thesis
#
# 	Copyright (C) 2017-2018 Xie Wang,
#   Department of Computer Science and Technology, Nanjing University.
#
#	Git repo: https://github.com/walkerWx/master_thesis.git
#
###############################################################################

PACKAGE=njuthesis
BST_FILE=gbt7714-2005.bst
SOURCES=$(PACKAGE).dtx $(PACKAGE).ins
CLS=$(PACKAGE).cls $(PACKAGE).cfg dtx-style.sty
THESIS=master_thesis
THESISCONTENTS=$(THESIS).tex
THESISBIB=$(THESIS).bib
INSTITUTE_LOGO=njulogo.eps
INSTITUTE_NAME=njuname.eps
TEXMFLOCAL=$(shell get_texmf_dir.sh)

.PHONY: all clean cls master_thesis 

all: cls master_thesis

###### generate cls/cfg
cls:  $(CLS)

$(CLS): $(SOURCES)
	latex $(PACKAGE).ins

###### for master thesis

master_thesis:	 $(THESIS).pdf

$(THESIS).pdf: $(CLS) $(INSTITUTE_LOGO) $(INSTITUTE_NAME) $(THESIS).tex $(THESISBIB) framework.tex
	xelatex $(THESIS).tex
	bibtex $(THESIS)
	xelatex $(THESIS).tex
	open $(THESIS).pdf

###### clean

clean:
	-@rm -f \
		*.aux \
		*.bak \
		*.bbl \
		*.blg \
		*.dvi \
		*.glo \
		*.gls \
		*.idx \
		*.ilg \
		*.ind \
		*.ist \
		*.log \
		*.out \
		*.ps \
		*.thm \
		*.toc \
		*.lof \
		*.lot \
		*.loe \
		*.sty \
		*.cfg \
		*.cls \
		*.sty
