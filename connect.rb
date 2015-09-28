require 'pg'

@conn = PG.connect(:dbname => 'nhatdao',
                  :user => 'nhatdao',
                  :password => '')
res = @conn.exec('SELECT * FROM Semesters')
puts res.getvalue(0,1)
