require "html/builder"
require "ecr/macros"
require "./../libs/patches"

class Views::Index
  getter :pull_requests

  def initialize(@pull_requests)
  end

  ecr_file "./views/index.ecr"
end

# class Views::Index
#   def render(locals)
#     HTML::Builder.new.build do
#       html do
#         head do
#           title { text "GB Pull Requests" }
#           link({ rel: "stylesheet", href: "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" }) {}
#           link({ rel: "stylesheet", href: "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" }) {}
#         end
#         body do
#           h1 { text "Pull Requests" }
#           div({ class: "well" }) do

#           end

#           locals["pull_requests"].each do |item|
#             div({ class: "well row" }) do
#               div({ class: "col-md-2" }) do
#                 img({ src: item.user.avatar_url, style: "height: 100px" }) {}
#               end

#               div({ class: "col-md-6" }) do
#                 h1 do
#                   a({ href: item.html_url }) { text item.title }
#                 end
#                 h2 do
#                   a({ href: item.user.html_url }) { text item.user.login }
#                 end
#               end
#               div({ class: "col-md-4" }) do
#                 h2 { text "#{item.comments} comments" }
#               end
#             end
#           end
#         end
#       end
#     end
#   end
# end
