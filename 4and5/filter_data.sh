#!/bin/bash
# How to run this script
# filter_data.sh <sample_data.csv>

echo "reading vulnerabilities data from $1"
if [ -z "$1" ]; then
  echo "Usage: $0 <sample_data.csv>"
  exit 1
fi

CSV="$1"
echo "Application Names which has vulberabilities"
tail -n +2 "$CSV" | \
grep -v '^N/A' | \
awk -F',' '{print $1 "," $2}' | \
sed 's/^\s*//;s/\s*$//' | \
awk -F',' '{ printf "%s,%s\n", $1, toupper($2) }' | \
sort | uniq
