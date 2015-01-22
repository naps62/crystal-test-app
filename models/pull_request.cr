require "json"
require "./user"

class GithubPullRequest
  json_mapping({
    title: { type: String },
    html_url: { type: String },
    user: { type: User },
    comments: { type: Int32 }
  })
end
