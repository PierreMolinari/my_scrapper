require 'nokogiri'
require 'open-uri'

def get_urls(url)
	page = Nokogiri::HTML(open(https://www.nosdeputes.fr/deputes))
	page.xpath('//td/a/@href ')
end 

def get_email(url)

end