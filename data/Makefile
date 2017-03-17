ALLSCRIPTS = $(basename $(wildcard *.R))
ALLIMAGES = $(addsuffix .png,$(ALLSCRIPTS))

all: $(ALLIMAGES)

%.png: %.R
	Rscript $< $@
