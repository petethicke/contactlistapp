#require 'pry'

require_relative 'contact'
#require_relative 'contact_database'
#require_relative 'phoneclass'


case ARGV[0]
when 'help'
  puts 'Here is a list of available commands: 
  new  - Create a new contact
  list - List all contacts
  show - Show a contact
  find - Find a contact
  delete - delete a contact'

when 'new'
  #phone_numbers = []
  ARGV.shift

  print 'Enter first name: '
  @first_name = gets.chomp
  print 'Enter last name: '
  @last_name = gets.chomp
  print 'Enter Email: '
  @email = gets.chomp

  #if Contact.emailpresent?(email)
    #puts 'Contact with that email already exists!'
    #exit
  #end

  #begin
  #   puts 'Phone number? (y/n)'
  #   if STDIN.gets.chomp.downcase == 'y'
  #     phone = true
  #     puts 'Enter the type'
  #     type = STDIN.gets.chomp
  #     puts 'Enter the number'
  #     numbers = STDIN.gets.chomp
  #     phone_numbers<<Phone.new(type, numbers)
  #     puts phone_numbers
  #   else
  #     phone = false
  #   end
  # end while phone == true
  contact = Contact.new("#{@first_name}" , "#{@last_name}", "#{@email}")
  contact.save


when 'list'
  Contact.list 
end

case
when ARGV[0] == 'show' && !ARGV[1].nil?
  Contact.show(ARGV[1])
when ARGV[0] == 'find' && !ARGV[1].nil?
  Contact.find(ARGV[1])
when ARGV[0] == 'delete' && !ARGV[1].nil?
  Contact.destroy(ARGV[1])
end






