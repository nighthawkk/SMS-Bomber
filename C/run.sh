if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <phone_number>"
    exit 1
fi

phoneNumber="$1"

gcc -o sender sender.c -lcurl -lssl -lcrypto
./sender $phoneNumber
rm sender