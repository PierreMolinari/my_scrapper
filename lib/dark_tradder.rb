require 'nokogiri'
require 'open-uri'


def crypto_scrapper

    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

    array_name =[]
    
        page.css('td.col-symbol').each do |name_crypto|
        array_name << name_crypto.text
        end

    array_value =[]
    
        page.xpath('//td/a[@class ="price"]').each do |value_crypto|
        array_value << value_crypto.text
        end

    name_value = Hash.new 
    name_value = array_name.zip(array_value).to_h
    
end


def perform
    return puts name_value
end
