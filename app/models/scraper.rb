require "pp"
require "httparty"
require "json"
auth_token = "8283edc5bd52751afefa3c1eeec58761"
timestamp = 559543287
url = "http://polling.3taps.com/poll?auth_token=#{auth_token}&anchor=#{timestamp}&metro=USA-CHI&retvals=heading,category,body,price,images"
data = JSON.parse HTTParty.get(url).response.body

posts = data["postings"].map {
	|p|
	Post.new("title" => p["heading"], "description" => p["body"])
}