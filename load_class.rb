
require './main.rb'
class Class
  def initialize(dept)
    @dept = dept
  end
  def load
      
    #this creates a new browser
    agent = Agent.new()
    agent.add_param('SSR_CLSRCH_WRK_SUBJECT$0',@dept)
    page = agent.load()
    
    #this unstage the xml part
    page =  page.search('PAGE#SSR_CLSRCH_RSLT FIELD#win0divPAGECONTAINER')
    new_page = Nokogiri::HTML(page.to_html)
    
    result = {}
    #this is where the main html locates at
    new_page = new_page.xpath("//div[starts-with(@id,'win0divSSR_CLSRSLT_WRK_GROUPBOX2$')]")

  #first loop iterates through each course 
  new_page.each do |f|
    course_title = f.xpath(".//div[starts-with(@id,'win0divSSR_CLSRSLT_WRK_GROUPBOX2GP$')]").text.strip
    result[course_title] = []

  #this loop iterates through each class section from a course 
    f.xpath(".//tr[starts-with(@id,'trSSR_CLSRCH_MTG1$')]").each do |t|
    row = {}
    class_id = t.xpath(".//div[starts-with(@id,'win0divMTG_CLASS_NBR$')]").text.strip
    section = {}

    section["instructor"] = t.xpath(".//div[starts-with(@id,'win0divMTG_INSTR$')]").text.strip

    #This gets section e.g 001-LEC  section_id-section_type
     s = t.xpath(".//div[starts-with(@id,'win0divMTG_CLASSNAME$')]").text.split("\n")[0].split("-")
     section["section_id"] = s[0]
     section["section_type"] = s[1]
   
    #This seperates date, start time, end time 
       section["meet_time"] = t.xpath(".//div[starts-with(@id,'win0divMTG_TOPIC$')]").text.strip
     
       time = t.xpath(".//div[starts-with(@id,'win0divMTG_DAYTIME$')]").text.split(" ")
       section["date"] = time[0]
       section["start_time"] = time[1]
        section["end_time"] = time[3]

        section["location"] = t.xpath(".//div[starts-with(@id,'win0divMTG_ROOM$')]").text.strip
        row[class_id] = section
        result[course_title].push(row)
      end
     end
   result
  end
end
