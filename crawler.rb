require './load_department.rb'
require 'Mechanize'
require './load_class.rb'
require 'json'
require 'pg'
require './migrate.rb'
#get list of department
@list_departments = Department.new().load()
@list = []
agent = Agent.new()
@list_departments.each do |x|
    row = {}	
    puts x
    page = agent.load_class(x)
    list_class= Class.new()
    row['Department'] = x
    row['Classes']=list_class.load(page)
    @list.push(row)

end
File.write('schedule.txt',@list.to_json)
file = JSON.parse(@list.to_json)
conn = Db_conn.new(file)
conn.migrate()


# agent = Agent.new()
# crawl(agent,@list_departments[0..50])
# agent2 = Agent.new()
# crawl(agent2,@list_departments[51..-1])

