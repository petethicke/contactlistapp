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

   def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      CSV.open("contacts.csv", "a") do |row|
        row << [name, email]  
      end
    end

    def find(index)
      # TODO: Will find and return contact by index
      CSV.foreach('contacts.csv') do |row|
        row.each do |element|
          if element.include 
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
    end
  end
end