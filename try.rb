
require 'json'
require './migrate.rb'

file = JSON.parse(File.read('schedule.txt'))
puts file.class

conn = Db_conn.new(file)
conn.migrate()
