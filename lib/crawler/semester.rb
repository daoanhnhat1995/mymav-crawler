require_relative 'agent'

module MyMav::Semester

	def self.load_all(agent=MyMav::Agent.new())
		agent.add_param('ICAction','CLASS_SRCH_WRK2_STRM$273$$prompt')
		agent.add_param('ICDoModal','1')
		page = agent.load()
		result = {}
		list_id = []
		id = page.xpath("//a[starts-with(@name,'RESULT0$')]").each {|y| list_id.push(y.text)}
		#add the last id because it s unique attr css
		list_id.push(page.css('a#SEARCH_RESULTLAST').text)
		list_semesters = page.xpath("//span[starts-with(@name,'RESULT2$')]").to_a
		(0..list_id.length-1).each do |e|
			result[list_id[e]] = list_semesters[e].text
			# conn.exec("INSERT INTO Semesters (\"name\",\"code\") VALUES(\'#{list_semesters[e].text}\', #{list_id[e]})")
		end
		return result
	end
end
