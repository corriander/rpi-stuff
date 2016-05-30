#!/bin/bash
# Set up a system user for managing crons, etc.
#
# Use this user via (e.g.) `sudo su - guardian -s /bin/bash`

adduser --system guardian
usermod -a -G vardata guardian
