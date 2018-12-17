BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/input
OUTPUTDIR=$(BASEDIR)/output

help:
	@echo 'Usage:                                                '   
	@echo '   make [html|pdf|docx|tex]                           '						
	@echo 'You can also enable debugging, e.g. make DEBUG=1 html.'

pdf:
	pandoc -s \
	"$(INPUTDIR)"/*.md \
	-o "$(OUTPUTDIR)/cv.pdf" \
	--template="$(INPUTDIR)/template.tex" \
	--pdf-engine=xelatex 


tex:
	pandoc -s \
	"$(INPUTDIR)"/*.md \
	-o "$(OUTPUTDIR)/cv.tex" \
	--template="$(INPUTDIR)/template.tex" \
	--latex-engine=xelatex \
	--variable urlcolor=cyan

docx:
	pandoc "$(INPUTDIR)"/*.md \
	-o "$(OUTPUTDIR)/cv.docx" \

html:
	pandoc "$(INPUTDIR)"/*.md \
	-o "$(OUTPUTDIR)/cv.html"

.PHONY: help pdf docx html tex
