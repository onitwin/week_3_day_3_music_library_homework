require ('pg')
require_relative('../db/sql_runner')


class Artist

  attr_accessor :name ,:id


  def initialize(options)
    @name=options['name']
    @id=options['id'].to_i if options['id']
  end



  def save #this works
    sql="INSERT INTO artists (name)
     VALUES ($1) RETURNING id"
     values=[@name]
     result=SqlRunner.run(sql,values)
     @id=result[0]['id'].to_i
  end

  def self.delete_all #this works
    sql='DELETE FROM artists'
    SqlRunner.run(sql)
  end


  def self.show_all
    sql='SELECT * FROM artists'
    result=SqlRunner.run(sql)
    return result.map{|item|Artist.new(item)}
  end

  def get_albums_by_id()
    sql='SELECT * FROM albums WHERE artist_id=$1'
    values=[@artist.id]
    result=SqlRunner.run(sql,values)
    artist_data=result[0]
    album=Albums.new(artist_data)
    return album
  end

  def get_albums_by_artist()
    sql='SELECT * FROM albums WHERE artist_id=$1'
    values=[@artist.name]
    result=SqlRunner.run(sql,values)
    artist_data=result[0]
    album=Albums.new(artist_data)
    return album
  end




























end
