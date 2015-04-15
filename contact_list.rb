#require 'pry'

require_relative 'contact'
#require_relative 'contact_database'
#require_relative 'phoneclass'


case ARGV[0]
when 'help'
  puts 'Here is a list of available commands: 
  new  - Create a new contact
  update - Update a contact
  list - List all contacts
  show - Show a contact
  lastname - Find by last name
  firstname - Find by first name
  email - Find by email
  delete - delete a contact'

when 'new'
  print 'Enter first name: '
  @first_name = gets.chomp
  print 'Enter last name: '
  @last_name = gets.chomp
  print 'Enter Email: '
  @email = gets.chomp


  contact = Contact.new("#{@first_name}", "#{@last_name}", "#{@email}")
  contact.save


when 'list'
  Contact.list 

when 'show'
  if !ARGV[1].nil?
    puts Contact.show(ARGV[1])
  end

when 'update' 
  ARGV.shift
  if !ARGV[0].nil?
    id = ARGV[0]
    ARGV.shift
    print 'Enter first name: '
    first_name = gets.chomp
    print 'Enter last name: '
    last_name = gets.chomp
    print 'Enter Email: '
    email = gets.chomp
    row = Contact.show(id)
    if row != nil
      contact = Contact.new(first_name, last_name, email)
      contact.id = (id)
      contact.save
    else
      puts 'Contact not found!'
    end
  end

when 'lastname' 
  print  'Enter last name: '
  ARGV.clear
  last_name = STDIN.gets()
  Contact.find_all_by_last_name("#{last_name}")


when 'firstname' 
  print  'Enter first name: '
  ARGV.clear
  first_name = gets.chomp.to_s
  Contact.find_all_by_first_name(first_name)


when 'email' 
  print  'Enter last email: '
  ARGV.clear
  last_name = STDIN.gets()
    Contact.find_by_email("#{email}")


when 'delete' 
  if !ARGV[1].nil?
    Contact.delete(ARGV[1])
  end
end
