require'pg'
require './migrate.rb'

conn = Db_conn.new("")
conn = conn.conn()
dates = ["Mo", "We", "Fr"]
dates = dates.to_s
dates = dates.sub('[','{')
dates = dates.sub(']','}')
puts dates
conn.exec("INSERT INTO Schedules (\"class_id\",\"course_id\",\"start_time\",\"end_time\",\"location\",\"instructor\",\"section_id\",\"section_type\",\"meeting_time\",\"dates\") VALUES ('23232',22,NULL,NULL,'ERB 103','Chengkai Li','002','LEC','Monday','#{dates}')")

