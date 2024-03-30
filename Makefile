.PHONY: all
all: link setup 

.PHONY: link
link:
	bin/link.sh

.PHONY: setup
setup:
	bin/setup.sh
