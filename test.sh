#!/bin/bash

# Reight test results
answers="0 0 0 1 1 0 0 0"

i=1

# Console color definitions
RED="\033[0;31m"
GREEN="\033[0;32m"
NC="\033[0m"

# Iterate over tests
for ans in $answers; do
	echo "Test ${i}"

	f1name="t${i}f1.txt"
	f2name="t${i}f2.txt"

	./comparator1.sh "tests/${f1name}" "tests/${f2name}" -v

	# Check the exit code of executed script
	if [ "$ans" -eq $? ]; then
		echo -e "Result: ${GREEN}PASSED${NC}"
	else
		echo -e "Result: ${RED}FAILED${NC}"
	fi

	i=$((i + 1))

	echo

done
