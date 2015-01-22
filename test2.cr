require "http/client"
require "json"
require "json/to_json"

client = HTTP::Client.new("hq.groupbuddies.com")

response = client.get("/github/pull_requests")
puts response.body.to_json
