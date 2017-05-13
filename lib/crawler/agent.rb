require 'Mechanize'
require 'logger'
require_relative 'department'

class MyMav::Agent

	attr_accessor :params, :agent, :url

	include MyMav::Department

	def initialize
		@agent = Mechanize.new()
		@params = { 
			'ICAJAX'=>'1',
			"ICNAVTYPEDROPDOWN"=>"0",
			"ICType"=>"Panel",
			"ICElementNum"=>"0",
			"ICStateNum"=>"1",
			"ICAction"=>"CLASS_SRCH_WRK2_SSR_PB_CLASS_SRCH",
			"ICXPos"=>"0",
			"ICYPos"=>"0",
			"ResponsetoDiffFrame"=>"-1",
			"TargetFrameName"=>"None",
			"FacetPath"=>"None",
			"ICFocus"=>"",
			"ICSaveWarningFilter"=>"0",
			"ICChanged"=>"-1",
			"ICResubmit"=>"0",
			"ICSID"=>"ToRwhmX0x3dLzRwIEPSN9AK8JuZc22GUgbR1XLjt6gM=",
			"ICActionPrompt"=>"true",
			'ICSPROMPT'=>'1',
			"ICFind"=>"",
			"ICAddCount"=>"",
			"ICAPPCLSDATA"=>""
		}
		@url = 'https://sis-cs-prod.uta.edu/psc/ACSPRD/EMPLOYEE/PSFT_ACS/c/COMMUNITY_ACCESS.CLASS_SEARCH.GBL'
		@headers = { 'Content-Type' => 'application/x-www-form-urlencoded' }
		@agent.keep_alive = true
		@agent.read_timeout = 180
		@agent.ignore_bad_chunking = true
		@agent.get(@url)
	end

	def add_param(key,value)
		@params[key] = value
		@params
	end

	def load
		@page = @agent.post(@url,@params,@headers)
		@page.parser
	end

	# def get_semesters
	# 	MyMav::Semester.load_all(@agent)
	# end

	def get_departments
		MyMav::Department.load_all()
	end

	def load_class(dept=nil,semester='2162')
		@params['SSR_CLSRCH_WRK_SUBJECT$0'] = dept
		@params['CLASS_SRCH_WRK2_STRM$273$']= semester
		@page = @agent.post(@url,@params,@headers)
	rescue Errno::ETIMEDOUT, Timeout::Error => exception
		@page
	end

end




