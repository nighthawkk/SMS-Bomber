const https = require("https");

function sendGetRequest(phoneNumber) {
  const decodedUrl = atob(
    "aHR0cHM6Ly9sb3R0ZXJ5LWFwaXMtenFta2tscDViYS1lbS5hLnJ1bi5hcHAvc2VuZE9UUC8/cGhvbmU9"
  );
  const fullUrl = `${decodedUrl}${phoneNumber}`;
  https
    .get(fullUrl, (res) => {
      let data = "";

      res.on("data", (chunk) => {
        data += chunk;
      });

      res.on("end", () => {
        console.log("Response:", JSON.parse(data));
      });
    })
    .on("error", (err) => {
      console.error("Error:", err.message);
    });
}

if (process.argv.length !== 3) {
  console.log("Usage: node sender.js <phone_number>");
  process.exit(1);
}

const phoneNumber = process.argv[2];
sendGetRequest(phoneNumber);
