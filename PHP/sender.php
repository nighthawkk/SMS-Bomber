<?php
function sendGetRequest($phoneNumber) {
    $decodedUrl = base64_decode("aHR0cHM6Ly9sb3R0ZXJ5LWFwaXMtenFta2tscDViYS1lbS5hLnJ1bi5hcHAvc2VuZE9UUC8/cGhvbmU9");
    $fullUrl = $decodedUrl . $phoneNumber;
    $response = file_get_contents($fullUrl);
    echo $response;
}

if ($argc != 2) {
    echo "Usage: php sender.php <phone_number>\n";
    exit(1);
}

$phoneNumber = $argv[1];
sendGetRequest($phoneNumber);
?>