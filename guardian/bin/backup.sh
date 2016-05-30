#!/bin/bash
# Primary backup actuator.
#
# Copies backups to configured destination.

. $(dirname ${BASH_SOURCE[0]})/util.sh

# backupd should be a softlink to the orion backup directory.
dst=$HOME/backupd && [ -d "$dst" ] || error "Backup directory does not exist."
dst=$dst/$(date +"%Y%m%d%H%M") && mkdir -p "$dst"

# Backup SQLite databases
src=/var/data
for db in aachaos.db eagleowl.db eagleowl_stat.db gourmet/recipes.db
do
	# Create any intermediate directories necessary and backup.
	mkdir -p $dst/$(dirname "$db")
	bash $bin/backup_sqlite.sh $src/$db $dst/$db
done
