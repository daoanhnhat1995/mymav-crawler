
require './main.rb'
class Class
  def initialize
  end

  def load(page)
    #this unstage the xml part
    page =  page.search('PAGE#SSR_CLSRCH_RSLT FIELD#win0divPAGECONTAINER')
    new_page = Nokogiri::HTML(page.to_html)
    list = []
    #this is where the main html locates at
    new_page = new_page.xpath("//div[starts-with(@id,'win0divSSR_CLSRSLT_WRK_GROUPBOX2$')]")

  #first loop iterates through each course 
  new_page.each do |f|
   result = {}
    #This gets course title and name [ACCT 2301, PRINCIPLES OF ACCOUNTING I] 
    course_title = f.xpath(".//div[starts-with(@id,'win0divSSR_CLSRSLT_WRK_GROUPBOX2GP$')]").text.strip.split("-")
    result["CourseID"] = course_title[0]
    result["Title"] = course_title[1]
    result["Sections"] = []

  #this loop iterates through each class section from a course 
    f.xpath(".//tr[starts-with(@id,'trSSR_CLSRCH_MTG1$')]").each do |t|
    

    section = {}
    #This gets  the class id e.g  81581
    class_id = t.xpath(".//div[starts-with(@id,'win0divMTG_CLASS_NBR$')]").text.strip
    section["ClassID"]=class_id

    section["Instructor"] = t.xpath(".//div[starts-with(@id,'win0divMTG_INSTR$')]").text.strip

    #This gets section e.g 001-LEC  section_id-section_type
     s = t.xpath(".//div[starts-with(@id,'win0divMTG_CLASSNAME$')]").text.split("\n")[0].split("-")
     section["SectionID"] = s[0]
     section["SectionType"] = s[1]
   
    #This seperates date, start time, end time 
       section["MeetingTime"] = t.xpath(".//div[starts-with(@id,'win0divMTG_TOPIC$')]").text.strip
     
       time = t.xpath(".//div[starts-with(@id,'win0divMTG_DAYTIME$')]").text.split(" ")
       section["Day"] = time[0]
       section["StartTime"] = time[1]
        section["EndTime"] = time[3]

        section["Room"] = t.xpath(".//div[starts-with(@id,'win0divMTG_ROOM$')]").text.strip
        
        result["Sections"].push(section)
      end
    list.push(result)
     end
   list
  end
end
