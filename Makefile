.PHONY: archive clean SUSE.list SLE.list openSUSE.list

all: file-lists

file-lists: SUSE.list SLE.list openSUSE.list

SUSE.list:
	find usr/ -name 20-defaults-SUSE.conf -printf "/%h\n/%p\n" >$@

SLE.list:
	find usr/ -name 25-defaults-SLE.conf -printf "/%h\n/%p\n" >$@

openSUSE.list:
	find usr/ -name 25-defaults-openSUSE.conf -printf "/%h\n/%p\n" >$@

install:
	tar -c usr/ | tar -x -C${DESTDIR}/

clean:
	rm -f *.list
