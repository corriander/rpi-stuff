#!/bin/sh
# Online backup of SQLite database.

src="$1"
dst="$2"

sqlite3 "$src" <<EOF
.timeout 20000
.backup $dst
EOF
