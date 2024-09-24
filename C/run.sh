if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <phone_number> <iteration_count>"
    exit 1
fi

phoneNumber="$1"
iteration_count="$2"

sh -c "gcc -o sender sender.c -lcurl -lssl -lcrypto && ./sender $phoneNumber $iteration_count && rm sender"