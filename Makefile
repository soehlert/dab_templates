BASEDIR:=$(shell dab basedir)

all: info/init_ok
	dab bootstrap
	cp ./files/ssh/sshd_config $(BASEDIR)/etc/ssh/sshd_config
	mkdir -p ${BASEDIR}/root/.ssh
	cp ./files/ssh/id_rsa.pub ${BASEDIR}/root/.ssh/authorized_keys
	dab install python2.7 python-pip
	echo BASEDIR: ${BASEDIR}
	echo "en_US.UTF-8" > ${BASEDIR}/etc/locale
	echo "en_US.UTF-8 UTF-8" > ${BASEDIR}/etc/locale.gen
	dab exec dpkg-reconfigure -f noninteractive locales
	dab exec echo "America/Chicago" > /etc/timezone
	dab exec cp /usr/share/zoneinfo/America/Chicago /etc/localtime
	dab exec dpkg-reconfigure -f noninteractive tzdata
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
