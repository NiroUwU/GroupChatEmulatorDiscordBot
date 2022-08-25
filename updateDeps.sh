#!/bin/bash
# This script updates all the dependancies

LIT_DEPS=( 'SinisterRectus/discordia' )
CMDS=()


# Update all lit dependancies:
for package in "${LIT_DEPS[@]}"; do
	lit install "$package"
done

# Execute other update commands:
for command in "${CMDS[@]}"; do
	$command
done
