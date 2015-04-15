#require 'pry'
require 'pg'
require 'active_record'

require_relative 'contact_database'


class Contact
  attr_accessor :first_name, :last_name, :email, :id

  def initialize (first_name, last_name, email)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @id = nil
  end

  def save
    if @id == nil
      sql = 'INSERT INTO contacts (firstname, lastname, email)
      VALUES ($1, $2, $3) RETURNING *'
      results = Db.connection.exec(sql, [first_name, last_name, email])
      puts results.inspect
      @id = results[0]['id']
    else
      sql = 'UPDATE contacts SET firstname=$1, lastname=$2, email=$3 WHERE id = $4'
      Db.connection.exec(sql, [first_name, last_name, email, @id])
    end
  end

  def self.delete(id)
    sql = 'DELETE FROM contacts WHERE id = $1'
    results = Db.connection.exec(sql, [id.to_i])
  end

  def self.list
    sql = 'SELECT * FROM contacts'
    results = Db.connection.exec(sql)
    results.each do |contact|
      puts contact
    end
  end

  def self.show(id)
    sql = 'SELECT * FROM contacts WHERE id = $1'
    results = Db.connection.exec(sql, [id.to_i])
    row = results[0]
    return row
  end

  def self.find_all_by_last_name(last_name)
    sql = "SELECT * FROM contacts WHERE lastname = $1" 
    results = Db.connection.exec(sql, [last_name])
    p results[0]
    puts 'Done'
  end

  def self.find_all_by_first_name(first_name)
    sql = "SELECT * FROM contacts WHERE firstname = $1" 
    results = Db.connection.exec(sql, [first_name])
    p results[0]
    puts 'Done'
  end

  def find_by_email(email)
    sql = "SELECT * FROM contacts WHERE email = $1"
    results = Db.connection.exec(sql, [email])
    p results[0]
  puts 'Done'
end
end

