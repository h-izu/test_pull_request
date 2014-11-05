# -*- coding: utf-8 -*-

require 'net/http'
require 'json'

url = URI.parse('http://api.openweathermap.org/data/2.5/weather?q=Tokyo,jp')
req = Net::HTTP::Get.new("#{url.path}?#{url.query}")

res = Net::HTTP.start(url.host, url.port) {|http|
  #add indent
  http.request(req)
}

parsed = JSON.parse(res.body)

p parsed
p parsed["weather"]

p "現在の東京の天気"
p parsed["weather"].first["main"]
