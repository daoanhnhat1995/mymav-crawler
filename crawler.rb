require './load_department.rb'
require 'Mechanize'
require './load_class.rb'
require 'json'

#get list of department
list_departments = Department.new().load()
list_departments = list_departments[0..-1]
list = []
agent = Agent.new()
list_departments.each do |x|
  row = {}
  puts x
  page = agent.load_class(x)
  list_class= Class.new()
  row['Department'] = x
  row['Classes']=list_class.load(page)
  list.push(row)
  File.write('schedule.txt',list.to_json)
end

#list classes
#list_departments.load().each do |d|
#  classes = Class.new(d)
#  list[d] = classes.load()
#end



