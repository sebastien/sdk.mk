#!/usr/bin/env bash
env P="${PATH_DEPS:-deps}" mkdir -p "$P" && git clone git@github.com:sebastien/sdk.mk.git "$P" && echo "Setup SDK: gmake -f $P/setup.mk"
# EOF
