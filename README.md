# MyMav schedule crawler

This library uses Mechanize and XPath to extract all course pages from UTA MyMav. It auto creates new agent to renew connection

# How to use

```ruby
require 'MyMav'
#create new agent
#you should keep track if an agent is going down
#check docs for agent's configuration
agent = MyMav::Agent.new()
#load semesters
MyMav::Semester.load_all(agent) 
#or with no agent will auto create a new agent
MyMav::Semester.load_all()
#load departments
MyMav::Department.load_all()
#load schedules with 100 first schedules
MyMav::Schedule.load_all(limits=100)
```