require ('pg')

class SqlRunner

  def self.run(sql,values=[])
    begin
      db=PG.connect({dbname:'music_library',host:'localhost'})#this has a dbname which is the database name of 'pizza_shop' and 'host' is address for data storage
      db.prepare('query',sql)
      result=db.exec_prepared('query',values)
    ensure
      db.close() if db!=nil
    end
    return result
  end
















end
