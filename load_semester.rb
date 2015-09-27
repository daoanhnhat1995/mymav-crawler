
require './main.rb'
agent = Agent.new()
agent.add_param('ICDoModal','1')
agent.add_param('ICAction','CLASS_SRCH_WRK2_STRM$273$$prompt')
page = agent.load()
document = page.parser
puts document.class
puts document.css('#PTSRCHRESULTS').text
