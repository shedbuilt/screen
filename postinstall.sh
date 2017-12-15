#!/bin/bash
if [ ! -e /etc/screenrc ]; then
    cp -v /etc/screenrc.default /etc/screenrc
fi
