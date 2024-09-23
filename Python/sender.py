import base64
import requests
import sys

def send_get_request(phone_number):
    decoded_url = base64.b64decode("aHR0cHM6Ly9sb3R0ZXJ5LWFwaXMtenFta2tscDViYS1lbS5hLnJ1bi5hcHAvc2VuZE9UUC8/cGhvbmU9").decode('utf-8')
    full_url = f"{decoded_url}{phone_number}"
    response = requests.get(full_url)
    print(response.text)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python sender.py <phone_number>")
        sys.exit(1)

    phone_number = sys.argv[1]
    send_get_request(phone_number)