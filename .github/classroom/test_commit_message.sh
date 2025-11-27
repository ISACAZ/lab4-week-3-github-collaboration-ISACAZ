#!/usr/bin/env bash
set -e
 
# Get latest commit message (lowercased)
MSG=$(git log -1 --pretty=%B | tr 'A-Z' 'a-z')
 
if \[\[ -z "$MSG" ]]; then
  echo "FAIL: Could not read last commit message"
  exit 1
fi
 
# Check only for the word "merge"
if echo "$MSG" | grep -qw "merge"; then
  echo "PASS: Commit message contains 'merge'"
  exit 0
else
  echo "FAIL: Commit message must contain the word 'merge'. Got: $MSG"
  exit 1
 
fi