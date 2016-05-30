#!/bin/bash
# Setup the guardian user and deploy assets.
#
# This user is responsible for taking backups; currently backups are limited to
# a local/mounted filesystem but this is just one step in the chain. Other
# mechanisms may be in place to augment this "manual" backup system.
#
# Parameters
#
#  1) Path to root backup directory (used to configure a symlink). 

. $(dirname ${BASH_SOURCE[0]})/bin/util.sh

sh "$selfd"/adduser.sh || fatal_error "Creation of guardian user failed."
home=/home/guardian && [ -d "$home" ] || fatal_error "$home does not exist."

sudo -u guardian -H sh -c 'cp -rp '"$selfd"'/bin '"$home"'/bin' || error "Deployment of guardian bin failed."
sudo -u guardian -H sh -c 'ln -s '"$1"' '"$home"'/backupd'

# TODO: Check that we're not duplicating (shouldn't be for a fresh setup).
sudo -u guardian -H sh -c \
	'(crontab -l 2>/dev/null; cat '"$selfd"'/cron.d/*) | crontab -'
