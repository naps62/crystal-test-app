#!/usr/bin/env ruby

require 'net/http'

puts Net::HTTP.get('hq.groupbuddies.com', '/')
