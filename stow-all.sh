#!/usr/bin/env bash

# Run Stow on all packages(directories) in the current
# directory.
#
# To restore all packages:
#     stow-all
#
# To unstow/unlink all packages:
#     stow-all -D
 
for d in *; do
	if [ -d ${d} ]; then
		stow -v $1 $d
	fi
done
