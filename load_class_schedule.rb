
require './main.rb'

agent = Agent.new()

puts agent.add_param('SSR_CLSRCH_WRK_SUBJECT$0',"ce")


page = agent.load()
page =  page.search('PAGE#SSR_CLSRCH_RSLT FIELD#win0divPAGECONTAINER')
new_page = Nokogiri::HTML(page.to_html)
item_count = new_page.css('td.SSSGROUPBOX').text

#Basically load each row of table
class_id =  new_page.xpath("//div[starts-with(@id,'win0divMTG_CLASS_NBR$')]").text.split("\n")
section =  new_page.xpath("//div[starts-with(@id,'win0divMTG_CLASSNAME$')]").text.split("\n")
instructor =  new_page.xpath("//div[starts-with(@id, 'win0divMTG_INSTR$')]").text.split("\n")
date =  new_page.xpath("//div[starts-with(@id,'win0divMTG_TOPIC$')]").text.split("\n")
location = new_page.xpath("//div[starts-with(@id,'win0divMTG_ROOM$')]").text.split("\n")
