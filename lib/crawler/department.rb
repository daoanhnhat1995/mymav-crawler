require 'Mechanize'

module MyMav 
  module Department 
		extend self
		URI = 'http://catalog.uta.edu/coursedescriptions/'
		def load_all(agent=Mechanize.new())
      page = agent.get(URI)
      department_list =[]
      page.parser.css('a.sitemaplink').each do |e|
				str = e.text.split(" ")[-1].delete "()"
				department_list << str unless str.include? "-"
			end
			department_list
		end  
	end 
end
