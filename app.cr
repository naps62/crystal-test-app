require "frank"
require "socket"
require "signal"
require "http/client"
require "json/to_json"
require "json"
require "./view"

# monkey patch. This
class TCPServer
  def initialize(port, backlog = 128)
    @sock = C.socket(C::AF_INET, C::SOCK_STREAM, 0)

    optval = 1
    C.setsockopt(@sock, C::SOL_SOCKET, 2, pointerof(optval) as Void*, sizeof(Int32))

    addr = C::SockAddrIn.new
    addr.family = C::AF_INET
    addr.addr = 0_u32
    addr.port = C.htons(port)
    if C.bind(@sock, pointerof(addr), 16) != 0
      raise Errno.new("Error binding TCP server at #{port}")
    end

    if C.listen(@sock, backlog) != 0
      raise Errno.new("Error listening TCP server at #{port}")
    end
  end
end


def pull_requests(query)
  client = HTTP::Client.new("hq.groupbuddies.com")
  client.get("/github/pull_requests?query=is:open%20#{query}").body.to_json
end


get "/:query" do |context|
  context.response.content_type = "text/html"
  View.new.render({ "items" => [1, 2, 3] })
  # query = context.request.params["query"]
  # pull_requests(query)
  # params[:name]
  # "Hello World"
end

# Signal.trap(Signal::INT) { server.close; exit }
