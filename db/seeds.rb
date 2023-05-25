# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'json'
require "open-uri"

puts " Cleaning database..."

User.destroy_all
Product.destroy_all

puts "Creating users"

user = User.create!(
  first_name: "Ben Lai",
  last_name: "Puah",
  email: "benlai@gmail.com",
  password:"testing"
)

puts "Creating products"

image1 = URI.open("https://images.unsplash.com/photo-1629367308496-a2496ba22f88?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80")
image2 = URI.open("https://images.unsplash.com/photo-1629367309270-1e6b8a303630?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
image3 = URI.open("https://images.unsplash.com/photo-1571646302210-db7990b30751?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80")

product1= Product.new(
  sku: "Guavaa_A",
  name: "Guava A",
  description: "Guava trees are native to tropical America but we different. Guava fruits are processed into jams, jellies, and preserves and are common pastry fillings.",
  price: 5
)

product1.photo.attach(io: image1, filename: "guavaA.jpg", content_type: "image/jpg")
product1.save!

product2= Product.new(
  sku: "Guavaa_B",
  name: "Guava B",
  description: "Looking not so good but taste same as Guava A. Guava trees are native to tropical America and are grown in tropical and subtropical areas worldwide.",
  price: 4
)

product2.photo.attach(io: image2, filename: "guavaB.jpg", content_type: "image/jpg")
product2.save!

product3= Product.new(
  sku: "Sekinchan_Corn",
  name: "Sekinchan Corn",
  description: "Sweet corn is the result of a naturally occurring recessive mutation in the genes. Which control conversion of sugar to starch inside the endosperm of the corn kernel.",
  price: 10
)

product3.photo.attach(io: image3, filename: "sekinchancorn.jpg", content_type: "image/jpg")
product3.save!

puts "Finished"
