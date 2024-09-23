#!/bin/sh

send_get_request() {
  decoded_url=$(echo "aHR0cHM6Ly9sb3R0ZXJ5LWFwaXMtenFta2tscDViYS1lbS5hLnJ1bi5hcHAvc2VuZE9UUC8/cGhvbmU9" | base64 --decode)
  full_url="${decoded_url}$1"
  curl "$full_url"
}

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <phone_number>"
  exit 1
fi

send_get_request "$1"