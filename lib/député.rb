require 'nokogiri'
require 'open-uri' 


def get_the_email_of_a_townhal_from_its_webpage (townhal_url)

	page = Nokogiri::HTML(open(townhal_url))
	urls_array = page.xpath('/html/body/div[1]/div[1]/div/div[2]/div[4]/div/ul[3]')
	urls_array.each do |node|
      puts node.text
end

get_the_email_of_a_townhal_from_its_webpage ("https://wiki.laquadrature.net/Contactez_vos_d%C3%A9put%C3%A9s")