
class ContactList

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
      #create new contact
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
end



require_relative 'contact'
require_relative 'contact_database'
