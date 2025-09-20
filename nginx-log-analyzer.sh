#!/bin/bash

if [ ! -f "$1" ]; then
    echo "The Nginx logfile was not specified or does not exist"
    exit 1
fi
log="$1"
echo "Top 5 IP addresses with the most requests:"
grep -E -o "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" $log | sort | uniq -c | sort -nr | head -n 5 | awk '{print "From address " $2 " - " $1 " requests"}'
echo -e "\nTop 5 most requested paths:"
grep -E -o "(GET|POST|PUT|DELETE) /[^ ]+" $log | sort | uniq -c | sort -nr | head -n 5 | awk '{print "To path " $3 " - " $1 " requests, method - " $2}'
echo -e "\nTop 5 response status codes:"
grep -E -o '" [0-9]{3}' $log | sort | uniq -c | sort -nr | head -n 5 | awk '{print "Status code " $3 " - " $1 " requests"}'