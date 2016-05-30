#!/bin/sh
# Bootstrap script for initial configuration.

EXTERNAL_HDD_BACKUP=/xfs/usb-hdd/backup/"`hostname`"

mkdir -p "$EXTERNAL_HDD_BACKUP"

cp -rp ./guardian /tmp/guardian

/tmp/guardian/setup.sh "$EXTERNAL_HDD_BACKUP"

