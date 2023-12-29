#!/bin/bash

echo "Starting program at $(date)" #Date will be substituted

echo "Running program $0 with $# arguments with program id $$"

for file in "$@";do
	grep foobar "$file" > /dev/null 2 > /dev/null
	#When pattern is not found, grep has exit status 1
	#We redirect STDOUT and STDERR to null register since we do not care about them
	if [[ "$?" -ne 0 ]] ; then
		echo "File $file does not have any foobar, adding one"
		echo "# foobar" >> "$file"

	fi
done
# foobar
