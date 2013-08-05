namespace :db do
  desc "erase and fill the database with fake stuff"
  task :populate => :development do
    require 'populator'
    require 'faker'

    Post.each(&:delete_all)

    Post.populate 20 do |p|
      p.title = Faker::Commerce.product_name
      p.description = Faker::Lorem.characters(195)
      p.category = ["Antiques", "Art", "Baby", "Auto Parts", "Books", "Bicycles", "Boats", "Automobiles", "Cell Phones", "Clothing & Accesories", "Collectibles", "Computers", "Electronics", "Furniture", "Garage & Estate Sales", "Health and Beauty", "Jewelery", "Musical Instruments", "Sporting Goods", "Tickets", "Tools", "Toys and Games" ]
