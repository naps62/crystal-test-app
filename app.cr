require "frank"
require "json"
require "./view"

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

def pull_requests
  client = HTTP::Client.new("hq.groupbuddies.com")
  client = HTTP::Client.new("hq.groupbuddies.com")
  response = client.get("/github/pull_requests?q=is:open")
  GithubPullRequestCollection.from_json(response.body)
end


get "/" do |context|
  context.response.content_type = "text/html"
  # query = context.request.params["query"]
  prs = pull_requests
  puts prs.total_count
  View.new.render({ "pull_requests" => prs.items })
  # pull_requests(query)
  # params[:name]
  # "Hello World"
end
