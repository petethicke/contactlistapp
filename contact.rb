#require 'pry'


class Contact

  attr_accessor :name, :email, :numbers

  def initialize(name, email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email 
  end

  
  def to_s
    # TODO: return string representation of Contact
    "Name: #{@name}, Email: #{@email}"
  end

  ## Class Methods
  class << self

    def init
      @@contacts = []
      
      CSV.readlines('contacts.csv').each do |row|
        @name = row[0]
        @email = row[1]
        row[2..-1].each do |numbers|
          @parts = phone.split(":")
          type = @parts[0]
          numbers = @parts[1]
          phone_numbers << Phone.new(type, numbers)
        end
        @@contacts << Contact.new(name, email, numbers)
      end
    end

    def create(name, email, numbers=[])
      CSV.open('contacts.csv', 'a') do |row|
        line = []
        line << name
        line << email
        numbers.each do |ph|
          line << "#{ph.type}:#{ph.numbers}"
        end
        row << line
      end
    end

    def find(word)
      # TODO: Will find and return contact by index
      CSV.foreach('contacts.csv') do |row|
        row.each do |element|
          if element.include?(word)
            puts "Name: #{row[0]} Email: #{row[1]}" 
          end
        end
      end
    end

    def all
      # TODO: Return the list of contacts, as is
      CSV.foreach('contacts.csv') do |row|
        puts row.inspect
      end
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
      csvIndex = 0
      CSV.foreach('contacts.csv') do |row|
        csvIndex += 1
        if csvIndex == id.to_i
          p "Name: #{row[0]} Email: #{row[1]}"
        end
      end
      csvIndex = 0
    end

    def emailpresent?(email)
      CSV.foreach('contacts.csv') do |row|
        if row[1].downcase == email.downcase
          return true
        end
      end
    end
  end
end