NAME = systemd-default-settings

.PHONY: archive clean

all:

install:
	tar -c usr/ | tar -x -C${DESTDIR}/

archive:
	@ver=$$(git describe --always) && \
	git archive --format=tgz --prefix=$(NAME)-$$ver/ HEAD >$(NAME)-$$ver.tar.gz

clean:
	rm -f *.tar.gz
