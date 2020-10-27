VERSION ?= $(shell git describe --always)

.PHONY: archive clean

all:

install:
	tar -c usr/ | tar -x -C${DESTDIR}/

archive: systemd-default-settings-$(VERSION).tar.gz

systemd-default-settings-$(VERSION).tar.gz:
	git archive --format=tgz --prefix=systemd-default-settings-$(VERSION)/ HEAD >$@

clean:
	rm -f *.tar.gz
