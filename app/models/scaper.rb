require 'httparty'
class scraper
	include HttParty
	format :json
	@auth_token = "8283edc5bd52751afefa3c1eeec58761"
	@timestamp = Time.now.to_i
	base_uri "http://polling.3taps.com/auth_key=#{auth_key}&timestamp=#{@timestamp}"
	

end

require 'pp'
pp scrape.parsed_response


