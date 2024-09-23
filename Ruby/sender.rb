require 'net/http'
require 'uri'
require 'base64'

def send_get_request(phone_number)
  base64_url = "aHR0cHM6Ly9sb3R0ZXJ5LWFwaXMtenFta2tscDViYS1lbS5hLnJ1bi5hcHAvc2VuZE9UUC8/cGhvbmU9"
  full_url = "#{Base64.decode64(base64_url)}#{phone_number}"
  response = Net::HTTP.get(URI(full_url))
  puts response
end

if ARGV.length != 1
  puts "Usage: ruby sender.rb <phone_number>"
  exit 1
end

send_get_request(ARGV[0])