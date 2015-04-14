#require 'pry'
require 'pg'

require_relative 'contact_database'


class Contact
  attr_accessor :first_name, :last_name, :email

  def initialize (first_name, last_name, email)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @id = nil
  end


  

  def save
    if @id == nil
      sql = 'INSERT INTO contacts (firstname, lastname, email)
      VALUES ($1, $2, $3)'
      results = Db.connection.exec(sql, [first_name, last_name, email])
      @id = results[0]['id']
    else
      sql = 'UPDATE contacts SET firstname = $1, lastname = $2, email = $3)
      VALUES ($1, $2, $3)'
      Db.connection.exec(sql, [first_name, last_name, email])
    end 
  end

  def self.list
    sql = 'SELECT * FROM contacts'
    results = Db.connection.exec(sql)
    results.each do |contact|
      puts contact.inspect
    end
  end

#   def show(id)
#     sql = 'SELECT * FROM contacts WHERE id = $1'
#     results = Db.connection.exec(sql, [id])
#     col = results[0]
#     puts col.inspect
#   end

# sql = "SELECT * FROM stagedocs_venue WHERE id=$1"
#         results = $conn.exec_params(sql, [id])
#         row = results[0]
#         puts row.inspect
#         venue = Venue.new(row["name"], row["capacity"])
#         venue.id = row["id"]
#         venue
end






#   def to_s
#     # TODO: return string representation of Contact
#     "Name: #{@name}, Email: #{@email}"
#   end

#   ## Class Methods
#   class << self



#       @@contacts = []

#       CSV.readlines('contacts.csv').each do |row|
#         @name = row[0]
#         @email = row[1]
#         row[2..-1].each do |numbers|
#           @parts = phone.split(":")
#           type = @parts[0]
#           numbers = @parts[1]
#           phone_numbers << Phone.new(type, numbers)
#         end
#         @@contacts << Contact.new(name, email, numbers)
#       end
#     end

#     def create(name, email, numbers=[])
#       CSV.open('contacts.csv', 'a') do |row|
#         line = []
#         line << name
#         line << email
#         numbers.each do |ph|
#           line << "#{ph.type}:#{ph.numbers}"
#         end
#         row << line
#       end
#     end

#     def find(word)
#       # TODO: Will find and return contact by index
#       CSV.foreach('contacts.csv') do |row|
#         row.each do |element|
#           if element.include?(word)
#             puts "Name: #{row[0]} Email: #{row[1]}" 
#           end
#         end
#       end
#     end

#     def all
#       # TODO: Return the list of contacts, as is
#       CSV.foreach('contacts.csv') do |row|
#         puts row.inspect
#       end
#     end

#     def show(id)
#       # TODO: Show a contact, based on ID
#       csvIndex = 0
#       CSV.foreach('contacts.csv') do |row|
#         csvIndex += 1
#         if csvIndex == id.to_i
#           p "Name: #{row[0]} Email: #{row[1]}"
#         end
#       end
#       csvIndex = 0
#     end

#     def emailpresent?(email)
#       CSV.foreach('contacts.csv') do |row|
#         if row[1].downcase == email.downcase
#           return true
#         end
#       end
#     end
#   end
# end