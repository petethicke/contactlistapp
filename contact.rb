require_relative 'contact_list'

class Contact
 
  attr_accessor :name, :email
 
  def initialize(name, email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
  end
 
 def cli_menu
    puts'Here is a list of available commands: 
    new  - Create a new contact
    list - List all contacts
    show - Show a contact
    find - Find a contact'
  end

  def cli_response
    @response = gets.chomp.downcase
  end

  def menu_select (responsee)
    case response
    when 'new'
      @new_contact
    when 'list'
      #lists all contacts
    when 'show'
      #shows a specific contact
    when 'find'
      #find a specific contact
    else
      puts 'I do not understand'
    end
  end

  def new_contact
    puts 'Enter full name of contact'
    @full_name = gets.chomp
    puts 'Enter email address of contact'
    @email_address = gets.chomp
  end

  def to_s
    # TODO: return string representation of Contact
    @email_to_s = @email.to_s
    @name_to_s = @name.to_s
  end
 
  ## Class Methods
  class << self
    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts

      CSV.open("./contacts.csv", "wb") do |csv|
      csv << [name, email] 
    end
  end
 
    def find(index)
      # TODO: Will find and return contact by index
    end
 
    def all
      # TODO: Return the list of contacts, as is
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
    end
    
  end
 
end