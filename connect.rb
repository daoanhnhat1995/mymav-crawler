require 'pg'

@conn = PG.connect(:dbname => 'nhatdao',
                  :user => 'nhatdao',
                  :password => '')






#@conn.exec("INSERT INTO Semesters (\"Name\",\"Code\") VALUES('Fall 2013', 93)")

#@conn.exec("INSERT INTO Classes (\"department_id\",\"course_id\",\"course_title\") VALUES (1,'CSE 3330','Databases')")
#@conn.exec("INSERT INTO Departments (\"semester_id\",\"name\") VALUES (2,'CSE')")
@conn.exec("INSERT INTO Schedules (\"class_id\",\"course_id\",\"start_time\",\"end_time\",\"location\",\"instructor\",\"section_id\",\"section_type\",\"meeting_time\") VALUES (1,8010,'2:00:00','7:00:00','ERB 103','Eric W. Becker','002','LEC','M-W-F')")

res = @conn.exec('SELECT * FROM Semesters')
puts res.getvalue(4,1)
