#!/bin/bash

SITE_LIST_FILE="sites.txt"

if [ ! -f "$SITE_LIST_FILE" ]; then
	echo "$SITE_LIST_FILE does not exist"
	exit 1
fi

N_TESTS=0
N_ERRORS=0
while read -r SITE || [ -n "$SITE" ]; do
	echo "Test site: $SITE"
	((N_TESTS++))

	RESPONSE_CODE=$(curl -s -o /dev/null -IL -w "%{http_code}" -m 10 "$SITE")
	if [ "$RESPONSE_CODE" == "200" ]; then
		echo "OK"
	else
		((N_ERRORS++))
		if [ "$RESPONSE_CODE" == "000" ]; then
			echo "ERROR. Timeout"
		else
			echo "ERROR. HTTP status code: $RESPONSE_CODE"
		fi
	fi

	echo
done < "$SITE_LIST_FILE"

echo "Done. $N_ERRORS errors of $N_TESTS sites"
