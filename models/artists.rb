require 'pg'
require_relative '../db/sql_runner.rb'


class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
  end

  #create and save artists
  def save()
    sql = "INSERT INTO artists(name)
    VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end


  #delete all artists
  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end


  #delete one artist - also needs to remove the albums too??
  def delete
    sql = "DELETE FROM artists WHERE id =$1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  #show all artists
  def self.all()
    sql = "SELECT * FROM artists"
    result = SqlRunner.run(sql)
    return result.map{|artist| Artist.new(artist)}
  end

  #show all albums for a given artist
  def albums
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{|album| Album.new(album)}
  end


  def update()
    sql = "UPDATE artists SET
    name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end


  def self.find(id)
    sql = "SELECT * from artists where id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Artist.new(result.first)
  end




end
