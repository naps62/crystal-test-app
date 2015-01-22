require "frank"
require "http/client"
require "./views/index"
require "./models/pull_request_collection.cr"

def pull_requests
  client = HTTP::Client.new("hq.groupbuddies.com")
  client = HTTP::Client.new("hq.groupbuddies.com")
  response = client.get("/github/pull_requests?q=is:open")
  GithubPullRequestCollection.from_json(response.body)
end

get "/" do |context|
  context.response.content_type = "text/html"
  prs = pull_requests
  Views::Index.new prs.items
end
