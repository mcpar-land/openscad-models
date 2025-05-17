SRCS := $(shell find models -name "*.scad")
OUT := $(subst .scad,.stl,$(SRCS))

all: $(OUT)

models/%.stl: models/%.scad
	openscad --debug=all --enable=all -o $@ $<

clear:
	find . -name "*.stl" | xargs rm
