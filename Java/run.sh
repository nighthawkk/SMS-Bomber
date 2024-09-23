if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <phone_number>"
    exit 1
fi

phoneNumber="$1"

javac Sender.java
java Sender "$phoneNumber"
rm Sender.class