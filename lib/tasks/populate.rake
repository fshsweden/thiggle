namespace :db do
  desc "fill the database with fake stuff"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    #WARNING - this will delete all your posts and all your users - WARNING
    Post.destroy_all
    User.destroy_all

    password = "12345678910"

    User.populate 10 do |u|
    	u.username = Faker::Internet::user_name
    	u.email = Faker::Internet::email
    	u.encrypted_password = User.new(:password => password).encrypted_password
    	u.confirmed_at = 1.year.ago..Time.now
    end

    #how to use: 
    #$~export ADMIN_USERNAME=matt
    #$~export ADMIN_EMAIL=naughtygirl2002@hotmail.com

   admin = User.new(:username => "matt", :email => "m@rickard.ly", :password => 'password', :password_confirmation => 'password')
   admin.skip_confirmation!
   admin.save




    Post.populate 50 do |p|
      p.title = Faker::Commerce.product_name
      p.description = Faker::Lorem.characters(5..200)
      p.user_id = 1..10
      p.category = ["Antiques", "Art", "Baby", "Auto Parts", "Books", "Bicycles", "Boats", "Automobiles", "Cell Phones", "Clothing & Accesories", "Collectibles", "Computers", "Electronics", "Furniture", "Garage & Estate Sales", "Health and Beauty", "Jewelery", "Musical Instruments", "Sporting Goods", "Tickets", "Tools", "Toys and Games" ]
      p.location = ["city of chicago", "north chicago", "south chicago", "west chicago", "northwest suburbs", "northwest indiana" ]
      p.price = 1..500
      p.created_at 2.years.ago..Time.now
    end

    Post.all.each { |p| p.photo = File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample); p.save! }
  end
end