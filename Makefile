.PHONY: archive clean SUSE.list SLE.list openSUSE.list

all: file-lists

file-lists: SUSE.list SLE.list openSUSE.list

SUSE.list:
	find usr/ -name \*.d -type d -printf "%%dir /%p\n" >$@
	find usr/ -name 20-defaults-SUSE.conf -printf "/%p\n" >>$@

SLE.list:
	find usr/ -name 25-defaults-SLE.conf -printf "/%p\n" >$@

openSUSE.list:
	find usr/ -name 25-defaults-openSUSE.conf -printf "/%p\n" >$@

install:
	tar -c usr/ | tar -x -C${DESTDIR}/

clean:
	rm -f *.list
