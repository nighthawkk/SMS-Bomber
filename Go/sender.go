package main

import (
    "encoding/base64"
    "fmt"
    "io/ioutil"
    "net/http"
    "os"
)

func sendGetRequest(phoneNumber string) {
    decodedUrl, _ := base64.StdEncoding.DecodeString("aHR0cHM6Ly9sb3R0ZXJ5LWFwaXMtenFta2tscDViYS1lbS5hLnJ1bi5hcHAvc2VuZE9UUC8/cGhvbmU9")
    fullUrl := fmt.Sprintf("%s%s", decodedUrl, phoneNumber)
    resp, err := http.Get(fullUrl)
    if err != nil {
        fmt.Println("Error:", err)
        return
    }
    defer resp.Body.Close()
    body, _ := ioutil.ReadAll(resp.Body)
    fmt.Println(string(body))
}

func main() {
    if len(os.Args) != 2 {
        fmt.Println("Usage: go run script.go <phone_number>")
        return
    }

    phoneNumber := os.Args[1]
    sendGetRequest(phoneNumber)
}
