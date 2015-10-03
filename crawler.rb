require './load_department.rb'
require 'Mechanize'
require './load_class.rb'
require 'json'
require 'pg'
#get list of department
@list_departments = Department.new().load()
@list = []
def crawl(agent,list_departments)
agent = Agent.new()
@list_departments.each do |x|
    row = {}	
    puts x
    page = agent.load_class(x)
    list_class= Class.new()
    row['Department'] = x
    row['Classes']=list_class.load(page)
    @list.push(row)
    File.write('schedule2.txt',@list.to_json)
end
end

# agent = Agent.new()
# crawl(agent,@list_departments[0..50])
# agent2 = Agent.new()
# crawl(agent2,@list_departments[51..-1])

