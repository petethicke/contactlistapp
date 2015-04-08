require 'pry'
class Contact

  attr_accessor :name, :email

  def initialize(name, email)
    # TODO: assign local variables to instance variables
  end

  
  def to_s
    # TODO: return string representation of Contact
    "Name: #{@name}, Email: #{@email}"
  end

  ## Class Methods
  class << self

   #@@contacts = CSV.read("contacts.csv")

 

    def init
      @@contacts = []
      
      CSV.readlines('contacts.csv').each do |row|
        phones = []
        name = row[0]
        email = row[1]
        row[2..-1].each do |phone|
          @parts = phone.split(":")
          type = @parts[0]
          number = @parts[1]
          phones << PhoneNumber.new(type, digits)
        end
        @@list_of_contacts << Contact.new(name, email, phones)
      end
    end

    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      CSV.open("contacts.csv", "a") do |row|
        row << [name, email]  
      end
    end


    def create(name, email, phone_number=[])
      CSV.open('contacts.csv', 'a') do |csv_object|
        line = []
        line<< new_contact.name
        line<< new_contact.email
        new_contact.phone_number.each do |ph|
          line<< "#{ph.type}:#{ph.digits}"
      end
        csv_object << line
      end
      return 'success'
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
          p "Name :#{row[0]} Email: #{row[1]}"
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