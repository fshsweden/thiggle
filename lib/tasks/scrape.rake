namespace :db do
  task :scrape => :environment do
 	require 'httparty'
 	require 'json'
 	require 'pp'

 	auth_token = "8283edc5bd52751afefa3c1eeec58761"
	timestamp = 360603269
	url = "http://polling.3taps.com/poll?auth_token=#{auth_token}&anchor=#{timestamp}&metro=USA-CHI&retvals=heading,category,body,price,images,source&source=ebayc"
	data = JSON.parse HTTParty.get(url).response.body
	count = 0

	data["postings"].each do |p| 
		#Post.create!(:title => p['title'].squish)
		if p["body"].present? && p["body"].length < 1000
			count = count + 1
			#pp p["body"]
			if p["images"][0].present? && p["images"][0].length > 3
				p["images"][0].each do |img|
					#pp img["full"]
				end
				
			end
		end
	end
	pp url
	pp count.to_s
  end

end