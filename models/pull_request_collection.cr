require "json"
require "./pull_request"

class GithubPullRequestCollection
  json_mapping({
    items: { type: Array(GithubPullRequest) }
  })
end
