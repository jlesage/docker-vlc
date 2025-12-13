#!/bin/sh

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.

# Generate machine id
if [ ! -f /config/machine-id ]; then
    echo "generating machine-id..."
    cat /proc/sys/kernel/random/uuid | tr -d '-' > /config/machine-id
fi

mkdir -p "$XDG_CONFIG_HOME"

[ -f "$XDG_CONFIG_HOME"/QtProject.conf ] || cp -v /defaults/QtProject.conf "$XDG_CONFIG_HOME"/

# vim:ft=sh:ts=4:sw=4:et:sts=4
