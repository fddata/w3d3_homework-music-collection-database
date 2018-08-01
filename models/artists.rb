require 'pg'
require_relative '../db/sql_runner.rb'


class Artist


  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists(name)
    VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    result = SqlRunner.run(sql)
    return result.map{|artist| Artist.new(artist)}
  end

  #DO I NEED TO UPDATE THE ARTIST?
  # def update()
  #   sql = "UPDATE artists SET
  #   (name) = ($1) WHERE id = $2"
  #   values = [@name, @id]
  #   SqlRunner.run(sql, values)
  # end





end
