all: link setup 

link:
	bin/link.sh

setup:
	bin/setup.sh

.PHONY: all link setup
