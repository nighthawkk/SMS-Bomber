if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <phone_number> <iteration_count>"
    exit 1
fi

phoneNumber=$1
iterationCount=$2

javac Sender.java
java Sender "$phoneNumber" "$iterationCount"
rm Sender.class
