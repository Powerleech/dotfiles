#!/bin/bash

var=$(git log -1 --pretty=%B)
lastcommit="Temporary stash - CAN_BE_REVERTED"

if [ "$var" = "$lastcommit" ]; then
	git pull
	echo "delete last commit from local branch"
	git reset HEAD^
	git status
	echo "delete last commit from remote branch"
	git push origin +HEAD
	git status
else
	echo "last commit won't be undone, as it didn't have to message 'Temporary stash - CAN_BE_REVERTED'"
fi
