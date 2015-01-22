require "http/client"
require "object"
require "json"
require "json/parser"
require "json/from_json"

class GithubPullRequest
  json_mapping({
    title: { type: String }
  })
end

class GithubPullRequestCollection
  json_mapping({
    total_count: { type: Int32 },
    items: { type: Array(GithubPullRequest) }
  })
end

client = HTTP::Client.new("hq.groupbuddies.com")
response = client.get("/github/pull_requests")


a = GithubPullRequestCollection.from_json(response.body)
