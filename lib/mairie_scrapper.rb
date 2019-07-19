
require 'nokogiri'
require 'rspec'
require 'rubocop'
require 'open-uri'

def get_cities_names
  array_of_cities = Array.new
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise"))
  page.css('a[href*="./95/"]').each do |node|
    array_of_cities << node.text.downcase.tr(" ", "-")

  end
  return array_of_cities
end

def get_cities_emails(cities_names)
  cities_array = Array.new
  for city in cities_names
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/" + city))
   
    city_email = page.css('tbody tr:nth-child(4) td:nth-child(2)')
  
    city_email = city_email[0]
    
    cities_array << city_email.text

  end
  return cities_array
end

def perform
  hash_final = Hash[get_cities_names.zip(get_cities_emails(get_cities_names))]
  return hash_final
end

puts perform