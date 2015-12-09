require 'pg'

##
#This script adds json data to postgresql database
#Tables: Semesters, Classes, Departments, Schedules
#
#

class Db_conn
  def initialize(data)


    @conn = PG.connect(:dbname => 'nhatdao',:user=>'nhatdao',:password=>'')
    @data = data
  end

  def conn
    @conn
  end

  def migrate
    #This adds to department table
    #By looping each department, add_index_to_classes 
    
    @schedule_fk = 0
    
    (0..@data.length-1).each do |d_index|
      #This line gets department name E.g CSE 
      department = @data[d_index]["Department"]

      #This inserts a row to department table with foreign key to semester
      @conn.exec("INSERT INTO Departments (\"semester_id\",\"name\") VALUES (1,'#{department}')")

      #This adds to class table , 
      #List of classes in one department
      classes = @data[d_index]["Classes"]
      
      #loop through each class and add_index_to_schedules       
      (0..classes.length-1).each do |c_index|
        #a single row
        aclass = classes[c_index]
       
        #extract each column's value
        course_id = aclass["CourseID"].strip
        course_title = "#{aclass["Title"]}".delete "'".strip

        #insert into classes table with foreign key to department
        @conn.exec("INSERT INTO Classes (\"department_id\",\"course_id\",\"course_title\") VALUES (#{d_index+1},'#{course_id}','#{course_title}')") 
      
        @schedule_fk = 1 + @schedule_fk #foreign key to classes table
        #list of sections in a course
        sections = aclass["Sections"]
        puts sections
        #this loops through each section with foreign key to classes
        sections.each do |s|

            #extract value from each column
            class_id = s["ClassID"]

            start_time = s["StartTime"]
            puts start_time
            end_time = s["EndTime"]
          
            
            location = s["Room"]
            instructor = s["Instructor"]
            instructor = instructor.delete "'"
            
            section_type = s["SectionType"]
            section_id = s["SectionID"]
            meeting_time = s["MeetingTime"]
            day = s["Day"].to_s
            day = day.sub('[','{')
            day = day.sub(']','}')
            begin 

              @conn.exec("INSERT INTO Schedules (\"class_id\",\"course_id\",\"start_time\",\"end_time\",\"location\",\"instructor\",\"section_id\",\"section_type\",\"meeting_time\",\"dates\") VALUES ('#{class_id}',#{@schedule_fk},'#{start_time}','#{end_time}','#{location}','#{instructor}','#{section_id}','#{section_type}','#{meeting_time}','#{day}')")

            rescue PG::InvalidDatetimeFormat
              
              @conn.exec("INSERT INTO Schedules (\"class_id\",\"course_id\",\"start_time\",\"end_time\",\"location\",\"instructor\",\"section_id\",\"section_type\",\"meeting_time\",\"dates\") VALUES ('#{class_id}',#{@schedule_fk},NULL,NULL,'#{location}','#{instructor}','#{section_id}','#{section_type}','#{meeting_time}','#{day}')")
            
            end
        end
     
      end
   
    end
  end
end
