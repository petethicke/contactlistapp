require_relative 'contact'
require_relative 'contact_database'


case ARGV[0]
when 'help'
  puts 'Here is a list of available commands: 
  new  - Create a new contact
  list - List all contacts
  show - Show a contact
  find - Find a contact'


when 'new'
  ARGV.shift
  print 'Enter Email: '
  @email = gets.chomp
  print 'Enter full name: '
  @name = gets.chomp
  Contact.create(@name, @email)
  

when 'list'
  ARGV.shift
  Contacts.all 


when 'show'
  ARGV.shift
  Contacts.show
end
