require 'rubygems'

require 'nokogiri'

require 'open-uri'

page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))

cours = page.xpath('//h1[@class="primary"]/a[@id="email"]')

cours.each do |cour|
  puts cour.text
end
puts page

