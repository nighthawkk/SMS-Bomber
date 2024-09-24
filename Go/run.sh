#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <phone_number> <iteration_count>"
    exit 1
fi

phoneNumber=$1
iterationCount=$2

go run sender.go "$phoneNumber" "$iterationCount"
