
require './main.rb'

agent = Agent.new()

puts agent.add_param('SSR_CLSRCH_WRK_SUBJECT$0',"ce")


page = agent.load()
page =  page.search('PAGE#SSR_CLSRCH_RSLT FIELD#win0divPAGECONTAINER')
new_page = Nokogiri::HTML(page.to_html)
item_count = new_page.css('td.SSSGROUPBOX').text


class_id =  new_page.xpath("//div[starts-with(@id,'win0divMTG_CLASS_NBR$')]").text.split("\n")
section =  new_page.xpath("//div[starts-with(@id,'win0divMTG_CLASSNAME$')]").text.split("\n")
instructor =  new_page.xpath("//div[starts-with(@id, 'win0divMTG_INSTR$')]").text.split("\n")
date =  new_page.xpath("//div[starts-with(@id,'win0divMTG_TOPIC$')]").text.split("\n")
location = new_page.xpath("//div[starts-with(@id,'win0divMTG_ROOM$')]").text.split("\n")
puts class_id[0]
puts section[0]
puts instructor[0]
puts date[0]



#new_page = new_page.css('#win0divDERIVED_CLSRCH_GROUP6 #win0divSSR_CLSRSLT_WRK_GROUPBOX1 #ACE_SSR_CLSRSLT_WRK_GROUPBOX1 #win0div$ICField$12$$0')
#puts new_page
#File.write('new.html',new_page)
# a = a.strip.split("\n")
# a = a.reject {|l| l == "" || l == " "}
# number = a[12]
# puts 'number is #{number}'
# a = a[13..-1]
# a = a.join(" ")

# puts document.css('#win0divMTG_ROOM$0')
