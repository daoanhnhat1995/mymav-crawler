
require './main.rb'
require 'pg'

#parse page to html document
conn = PG.connect(
                  :host => 'ec2-54-204-30-115.compute-1.amazonaws.com',
                  :dbname => 'drlb8scjl9op8',
                  :user => 'nwvvcvecinworx',
                  :port => '5432',
                  :password => 'HjVb86UO4sPwPHNePIu3Sho1Ns')


conn.exec("CREATE TABLE semesters (id serial primary key, name text, code int);")
conn.exec("CREATE TABLE departments (id serial primary key, semester_id int REFERENCES semesters (id), name text);")
conn.exec("CREATE TABLE classes (id serial primary key, department_id int REFERENCES departments(id),course_id text NOT NULL, course_title text);")
conn.exec("CREATE TABLE schedules (id serial primary key, class_id int NOT NULL UNIQUE, section_id char(20), section_type char(20), meeting_time text, start_time time without time zone, end_time time without time zone, location text, instructor text, dates text[], course_id int REFERENCES classes(id));")





