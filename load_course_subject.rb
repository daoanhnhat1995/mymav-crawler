#This script gets list of course subject 
# {CSE Computer Science Engineering}
# Might save to postresql too
#
require 'mechanize'

agent = Mechanize.new()
page =  agent.get('http://catalog.uta.edu/coursedescriptions/')
list =[]
puts page.class
puts page.parser.class
page.parser.css('a.sitemaplink').each do |e|
  list << e.text
 

end
puts list
  
 
  

