require 'net/http'
require 'net/https'
require 'uri'

url = URI.parse('https://sis-cs-prod.uta.edu/psc/ACSPRD/EMPLOYEE/PSFT_ACS/c/COMMUNITY_ACCESS.CLASS_SEARCH.GBL')

http = Net::HTTP.new(url.host,url.port)
http.use_ssl = true
res,data = http.post(url,nil)
cookie = res.response['set-cookie']
puts cookie

headers = {

    'Cookie' => cookie,
     "user-agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.13+ (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2",
     'Content-Type' => 'application/x-www-form-urlencoded'

}
semester_load = 'ICDoModal=1&ICAJAX=1&ICSPROMPT=1&ICNAVTYPEDROPDOWN=0&ICType=Panel&ICElementNum=0&ICStateNum=1&ICAction=CLASS_SRCH_WRK2_STRM%24273%24%24prompt&ICXPos=0&ICYPos=0&ResponsetoDiffFrame=-1&TargetFrameName=None&FacetPath=None&ICFocus=&ICSaveWarningFilter=0&ICChanged=-1&ICResubmit=0&ICSID=MPNQrGlpMbAyiybvA5zY4BTDjY8QIXjhL3uBqx8RNx0%3D&ICActionPrompt=true&ICFind=&ICAddCount=&ICAPPCLSDATA=&CLASS_SRCH_WRK2_STRM$273$=2158' 

resp =  http.post(url,semester_load,headers)
puts resp.body

course_load = 'ICAJAX=1&ICNAVTYPEDROPDOWN=0&ICType=Panel&ICElementNum=0&ICStateNum=3&ICAction=SSR_CLSRCH_WRK2_SSR_ALPHANUM_#{alphabet}&ICXPos=0&ICYPos=0&ResponsetoDiffFrame=-1&TargetFrameName=None&FacetPath=None&ICFocus=&ICSaveWarningFilter=0&ICChanged=-1&ICResubmit=0&ICSID=5SvE0g8wEOyBupHJFuF9Y2V6IyZLqk2GOyGbqtssbdM%3D&ICActionPrompt=false&ICFind=&ICAddCount=&ICAPPCLSDATA='

('A'..'Z').each {|letter| puts letter}
