#!/bin/bash
./configure --prefix=/usr                     \
            --infodir=/usr/share/info         \
            --mandir=/usr/share/man           \
            --with-socket-dir=/run/screen     \
            --with-pty-group=5                \
            --with-sys-screenrc=/etc/screenrc
sed -i -e "s%/usr/local/etc/screenrc%/etc/screenrc%" {etc,doc}/*
make -j $SHED_NUM_JOBS
make DESTDIR=${SHED_FAKE_ROOT} install
mkdir -v ${SHED_FAKE_ROOT}/etc
install -m 644 etc/etcscreenrc ${SHED_FAKE_ROOT}/etc/screenrc.default
