# MyMav schedule crawler

This library uses Mechanize and XPath to extract all course pages from UTA MyMav. It auto creates new agent to renew connection
### XML Homepage is at [MyMav](https://sis-portal-prod.uta.edu/psp/AEPPRD/EMPLOYEE/PSFT_ACS/c/COMMUNITY_ACCESS.CLASS_SEARCH.GBL?pslnkid=UTA_PS_CLASS_SCHEDULE_LINK&PORTALPARAM_PTCNAV=UTA_PS_CLASS_SCHEDULE&EOPP.SCNode=EMPL&EOPP.SCPortal=EMPLOYEE&EOPP.SCName=ADMN_CATALOGS_AND_CLASSES&EOPP.SCLabel=Catalogs%2520and%2520Classes&EOPP.SCPTcname=&FolderPath=PORTAL_ROOT_OBJECT.PORTAL_BASE_DATA.CO_NAVIGATION_COLLECTIONS.ADMN_CATALOGS_AND_CLASSES.ADMN_S200910131407282926114688&IsFolder=false)
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
