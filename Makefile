BUILDDIR:=obj
SRCDIR:=src
OUTDIR:=out

SRC := $(shell find $(SRCDIR) -name "*.md")
OBJECTS := $(addprefix $(BUILDDIR)/,$(notdir $(SRC:%.md=%.html)))
OUTPUTS := $(addprefix $(OUTDIR)/,$(notdir $(SRC:%.md=%.html)))

$(BUILDDIR)/%.html: $(SRCDIR)/%.md
	@mkdir -p $(BUILDDIR)
	pandoc -o $@ $<

$(OUTDIR)/%.html: $(BUILDDIR)/%.html $(SRCDIR)/header.html $(SRCDIR)/footer.html
	@mkdir -p $(OUTDIR)
	cat src/header.html $< src/footer.html > $@

all: $(OUTPUTS)
