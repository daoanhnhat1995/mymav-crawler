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

  def migrate
    #This adds to department table
    #By looping each department, add_index_to_classes 
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
        course_id = aclass["CourseID"]
        course_title = aclass["Title"]
        course_title = course_title.delete '\''

        #insert into classes table with foreign key to department
        @conn.exec("INSERT INTO Classes (\"department_id\",\"course_id\",\"course_title\") VALUES (#{d_index+1},'#{course_id}','#{course_title}')") 
      
        #list of sections in a course
        sections = aclass["Sections"]
        puts sections
        #this loops through each section with foreign key to classes
        sections.each do |s|

            #extract value from each column
            class_id = s["ClassID"]
            course_id = c_index +1 #foreign key to classes table
            start_time = s["StartTime"]
            end_time = s["EndTime"]
          
            
            location = s["Room"]
            instructor = s["Instructor"]
            instructor = instructor.delete '\''

            section_type = s["SectionType"]
            section_id = s["SectionID"]
            meeting_time = s["MeetingTime"]
            day = s["Day"]

            if start_time
              @conn.exec("INSERT INTO Schedules (\"class_id\",\"course_id\",\"start_time\",\"end_time\",\"location\",\"instructor\",\"section_id\",\"section_type\",\"meeting_time\",\"day\") VALUES ('#{class_id}',#{course_id},'#{start_time}','#{end_time}','#{location}','#{instructor}','#{section_id}','#{section_type}','#{meeting_time}','#{day}')")
            else
              @conn.exec("INSERT INTO Schedules (\"class_id\",\"course_id\",\"start_time\",\"end_time\",\"location\",\"instructor\",\"section_id\",\"section_type\",\"meeting_time\",\"day\") VALUES ('#{class_id}',#{course_id},NULL,NULL,'#{location}','#{instructor}','#{section_id}','#{section_type}','#{meeting_time}','#{day}')")

            end
        end
     
      end
   
    end
  end
end
