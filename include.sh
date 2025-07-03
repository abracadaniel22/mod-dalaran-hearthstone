#!/usr/bin/env bash
# The purpose of this file is to run conf/conf.sh.dist, which, in turn, auto run required DB queries
# I am not sure if this file is required or if the server would find and run the sql files automatically.

MOD_DALARAN_HEARTHSTONE_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/" && pwd )"

source $MOD_DALARAN_HEARTHSTONE_ROOT"/conf/conf.sh.dist"
