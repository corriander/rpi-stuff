#!/bin/bash
# Source this into scripts to provide common functionality.

self_path=$0	# No need for BASH_SOURCE; don't want this script name.
self=$(basename "$self_path")
selfd=$(realpath $(dirname "$self_path"))
bin=$(dirname "${BASH_SOURCE[0]}")

error () {
	echo "Error: ${self}: $1" 2>&1
}

fatal_error () {
	error "$1"
	exit 1
}
