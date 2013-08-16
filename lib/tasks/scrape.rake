namespace :db do
  task :scrape => :environment do
 	require 'httparty'
 	require 'json'
 	require 'pp'
 	require 'open-uri'

 	auth_token = "8283edc5bd52751afefa3c1eeec58761"
	timestamp = 567582723
	#BKPGE, CRAIG, EBAYC, INDEE, KIJIJ
	source = "EBAYC"
	url = "http://polling.3taps.com/poll?auth_token=#{auth_token}&anchor=#{timestamp}&metro=USA-CHI&retvals=heading,category,body,price,images,source&source=#{source}"
	data = JSON.parse HTTParty.get(url).response.body
	count = 0

	data["postings"].each do |p| 
		#Post.create!(:title => p['title'].squish)
		if p["body"].present? && p["body"].length < 1250 && p["images"][0].present? && p["images"][0].length > 1

				q = Post.new(:title => p["heading"], :category => "Antiques", :description => p["body"], :price => p["price"], :user_id => 2, :location => "city of chicago")
				q.photo  = open(p["images"][0][0]["full"])
				# q.photo2 = open(p["images"][0][1]["full"])
				# q.photo3 = open(p["images"][0][2]["full"])
			    q.save!
				# pp p["images"][0][0]["full"]
		end
	end
	pp url
	pp count.to_s
  end

end