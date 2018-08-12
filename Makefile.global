BASEDIR:=$(shell dab basedir)

all: info/init_ok
	dab bootstrap
	dab install python2 python-pip
	echo BASEDIR: ${BASEDIR}
	sed -e 's/^#PermitRootLogin prohibit-password/PermitRootLogin yes/' -i ${BASEDIR}/etc/ssh/sshd_config
	dab finalize

info/init_ok: dab.conf
	dab init
	touch $@

.PHONY: clean
clean:
	dab clean
	rm -f *~

.PHONY: dist-clean
dist-clean:
	dab dist-clean
	rm -f *
