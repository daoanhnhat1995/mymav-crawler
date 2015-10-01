require 'pg'

@conn = PG.connect(:dbname => 'nhatdao',
                  :user => 'nhatdao',
                  :password => '')





con.exec "CREATE TABLE Semesters (Id INTEGER PRIMARY KEY,Name VARCHAR(20))"
con.exec "INSERT INTO Semesters (1325,'Fall 2015')"

res = @conn.exec('SELECT * FROM Semesters')

puts res.getvalue(0,1)
