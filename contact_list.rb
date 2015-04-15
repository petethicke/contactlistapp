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
  find - Find a contact
  delete - delete a contact'

when 'new'
  print 'Enter first name: '
  @first_name = gets.chomp
  print 'Enter last name: '
  @last_name = gets.chomp
  print 'Enter Email: '
  @email = gets.chomp


  contact = Contact.new("#{@first_name}" , "#{@last_name}", "#{@email}")
  contact.save


when 'list'
  Contact.list 

when 'show'
  if !ARGV[1].nil?
    puts Contact.show(ARGV[1])
  else
    false
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

when 'find by last name' 
  if !ARGV[1].nil?
    Contact.find_all_by_last_name(ARGV[1])
  end

when 'find by first name' 
  if !ARGV[1].nil?
    Contact.find_all_by_first_name(ARGV[1])
  end

when 'find by email' 
  if !ARGV[1].nil?
    Contact.find_by_email(ARGV[1])
  end

when 'delete' 
  if !ARGV[1].nil?
    Contact.delete(ARGV[1])
  end
end





















 # if Contact.emailpresent?(email)
  #   puts 'Contact with that email already exists!'
  #   exit
  # end

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





