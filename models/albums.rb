require ('pg')

class Album

  attr_accessor :title,:genre,:id,:artist_id

  def initialize(options)
    @id=options['id'].to_i if options['id']
    @title=options['title']
    @genre=options['genre']
    @artist_id=options['artist_id'].to_i
  end

  def save()#this works
    sql="INSERT INTO albums (title,genre,artist_id)
    VALUES($1,$2,$3) RETURNING id"
    values=[@title,@genre,@artist_id]
    result=SqlRunner.run(sql,values)
    @id=result[0]['id'].to_i
  end

  def self.delete_all#this works
    sql='DELETE FROM albums'
    SqlRunner.run(sql)
  end


  def self.show_all#this works
    sql='SELECT * FROM albums'
    result=SqlRunner.run(sql)
    return result.map{|item|Album.new(item)}
  end

  def get_artist_by_id()
    sql='SELECT * FROM artists WHERE id= $1'
    values=[@artist_id]
    result=SqlRunner.run(sql, values)
    artist_data=result[0]
    artist= Artist.new(artist_data)
    return artist
  end














end
