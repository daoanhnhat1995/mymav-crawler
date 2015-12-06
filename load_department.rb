#This script gets list of course subject 
# {CSE Computer Science Engineering}
# Might save to postresql too
#
class Department
  def initialize
    @url = "http://catalog.uta.edu/coursedescriptions/"
    @agent = Mechanize.new()

    @conn = PG.connect(:dbname => 'nhatdao',
                  :user => 'nhatdao',
                  :password => '')
  end
  def load
      page =  @agent.get('http://catalog.uta.edu/coursedescriptions/')
      @list =[]
      puts page.parser.class
      page.parser.css('a.sitemaplink').each do |e|
        str = e.text.split(" ")[-1].delete "()"
        if !str.include? "-"
          @list << str
          #add rows to postgres departments table
          @conn.exec("INSERT INTO Departments (\"semester_id\",\"name\") VALUES (1,'#{str}')")

        end
      end
      @list
  end  
end 
  

