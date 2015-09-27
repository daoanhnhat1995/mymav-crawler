#This script loads course schedules from all majors
#
#
require 'mechanize'
require 'nokogiri'
#require './load_course_subject.rb'
agent = Mechanize.new
#load_subject = Subjects.new(agent)
#list_subjects = load_subject.load()
#puts list_subjects.content
#list_subjects.each do {|e| puts e}
#subject = 'CSE'
headers = {
        'Content-Type' => 'application/x-www-form-urlencoded',
        'accept'=>'text/html'
 }

payload = {
"ICAJAX"=>"1",
"ICNAVTYPEDROPDOWN"=>"0",
"ICType"=>"Panel",
"ICElementNum"=>"0",
"ICStateNum"=>"1",
"ICAction"=>"CLASS_SRCH_WRK2_SSR_PB_CLASS_SRCH",
"ICXPos"=>"0",
"ICYPos"=>"196",
"ResponsetoDiffFrame"=>"-1",
"TargetFrameName"=>"None",
"FacetPath"=>"None",
"ICFocus"=>"",
"ICSaveWarningFilter"=>"0",
"ICChanged"=>"-1",
"ICResubmit"=>"0",
"ICSID"=>"ToRwhmX0x3dLzRwIEPSN9AK8JuZc22GUgbR1XLjt6gM=",
"ICActionPrompt"=>"false",
"ICFind"=>"",
"ICAddCount"=>"",
"ICAPPCLSDATA"=>"",
"CLASS_SRCH_WRK2_STRM$273$"=>"2158",
"SSR_CLSRCH_WRK_SUBJECT$0"=>"ce"
       }

url =' https://sis-cs-prod.uta.edu/psc/ACSPRD/EMPLOYEE/PSFT_ACS/c/COMMUNITY_ACCESS.CLASS_SEARCH.GBL'
page = agent.get(url)
page = agent.post(url,payload,headers)
page =  page.search('PAGE#SSR_CLSRCH_RSLT FIELD#win0divPAGECONTAINER')
new_page = Nokogiri::HTML(page.to_html)
new_page = new_page.css('table.PSPAGECONTAINER #win0divPSPAGECONTAINER')

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
