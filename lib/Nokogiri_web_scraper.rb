require 'nokogiri'
require 'open-uri'

def origin
	puts "---------------------Liste of CoinMarketCap and price-------------------"
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	return page

end


def symbol_list(data)
	symbol_list_array = []
	symbol_list = data.xpath ('//*[@class= "text-left col-symbol"]')
	for i in 0..symbol_list.length-1 do
		symbol_list_array << symbol_list[i].text
	end
	return symbol_list_array
end
	


def coins_list(data)
coins_list_array = []
coins_list = data.xpath('//*[@class= "price"]')
for i in 0..coins_list.length-1 do
	coins_list_array << coins_list[i].text
end
return coins_list_array
end

def result(symbol,coins)
	result = []
	for i in 0..symbol.length-1 do
		result << [{symbol[i] => coins[i]}]
	end
	print result
	return result
end

def perform
	dat = origin
	symbol = symbol_list(dat)
	coins = coins_list(dat)
	result(symbol,coins)
end
perform