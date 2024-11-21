SRCS := $(shell find models -name "*.scad")
OUT := $(subst .scad,.stl,$(SRCS))

all: $(OUT)

%.stl: %.scad
	openscad -o $@ $<

clear:
	rm $(OUT)
