#!/bin/bash
# Rotate backups (except it doesn't, right now)

# Due to an NTFS backup partition, backups are currently not incremental. This
# will do something like
# 
# https://nicaw.wordpress.com/2013/04/18/bash-backup-rotation-script/
#
# In the meantime, it just removes old backups. NOTE that GNU find is used here.

. $(dirname ${BASH_SOURCE[0]})/util.sh

find $HOME/backupd -type d -maxdepth 1 -mtime -2 || \
	fatal_error "Backups don't appear to be fresh."

find $HOME/backupd -type d -maxdepth 1 -mtime +14 -delete 
