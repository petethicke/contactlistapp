
class ContactList

  def cli_menu
    puts'Here is a list of available commands: 
    new  - Create a new contact
    list - List all contacts
    show - Show a contact
    find - Find a contact'
  end

  def cli_response
    response = gets.chomp.downcase
  end

end



require_relative 'contact'
require_relative 'contact_database'
