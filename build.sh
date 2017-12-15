#!/bin/bash
./configure --prefix=/usr                     \
            --infodir=/usr/share/info         \
            --mandir=/usr/share/man           \
            --with-socket-dir=/run/screen     \
            --with-pty-group=5                \
            --with-sys-screenrc=/etc/screenrc
sed -i -e "s%/usr/local/etc/screenrc%/etc/screenrc%" {etc,doc}/*
make -j $SHED_NUMJOBS
make DESTDIR=${SHED_FAKEROOT} install
mkdir -v ${SHED_FAKEROOT}/etc
install -m 644 etc/etcscreenrc ${SHED_FAKEROOT}/etc/screenrc.default
