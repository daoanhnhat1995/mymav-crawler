require 'minitest/autorun'
require_relative 'agent'
require_relative 'semester'
require_relative 'schedule'
require_relative 'department'

class AgentTest < Minitest::Test
	def test_it_should_load_all_semesters
		results = MyMav::Semester.load_all()
		assert_equal results.keys.length, 3
	end

	def test_it_should_load_all_departments
		results = MyMav::Department.load_all()
		assert results.length > 0
	end

	def test_it_should_load_all_schedules
		lsize = MyMav::Schedule::QUERY_SIZE
		results = MyMav::Schedule.load_all()
		assert_equal results.length, lsize
	end
end
