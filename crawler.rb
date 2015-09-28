require './load_department.rb'
require 'Mechanize'
require './load_class.rb'

#get list of department
list_departments = Department.new()
dept = list_departments.load()[0]

classes = Class.new(dept)
puts classes.load()
