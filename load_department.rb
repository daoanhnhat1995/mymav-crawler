#This script gets list of course subject 
# {CSE Computer Science Engineering}
# Might save to postresql too
#
class Department
  def initialize
    @url = "http://catalog.uta.edu/coursedescriptions/"
    @agent = Mechanize.new()
  end
  def load
      page =  @agent.get('http://catalog.uta.edu/coursedescriptions/')
      @list =[]
      puts page.parser.class
      page.parser.css('a.sitemaplink').each do |e|
        str = e.text.split(" ")[-1].delete "()"
        if !str.include? "-"
          @list << str
        end
      end
      @list
  end  
end 
  

