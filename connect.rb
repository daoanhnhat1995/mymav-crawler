require 'pg'


@conn = PG.connect(
                  :host => 'localhost',
                  :dbname => 'nhatdao',
                  :user => 'nhatdao',
                  :port => '5432'
)



#@conn.exec("INSERT INTO Semesters (\"name\",\"code\") VALUES('Fall 2013', 93)")


# @conn.exec("INSERT INTO Classes (\"department_id\",\"course_id\",\"course_title\") VALUES (2,'CSE 3330','Databases')")
#@conn.exec("INSERT INTO Departments (\"semester_id\",\"name\") VALUES (2,'CSE')")
@conn.exec("INSERT INTO Schedules (\"class_id\",\"course_id\",\"start_time\",\"end_time\",\"location\",\"instructor\",\"section_id\",\"section_type\") VALUES (1,8010,'2:00:00','7:00:00','ERB 103','Eric W. Becker','002','LEC')")

#res = @conn.exec('SELECT * FROM Semesters')
#puts res.getvalue(4,1)

#@conn.exec("CREATE TABLE Semesters (id INTEGER PRIMARY KEY, name TEXT UNIQUE, code INTEGER UNIQUE NOT NULL)")

#@conn.exec("CREATE TABLE Departments (id INTEGER PRIMARY KEY, semester_id INTEGER, name TEXT NOT NULL)")
