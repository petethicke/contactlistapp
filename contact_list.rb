require 'active_record'
require 'pg'
require_relative 'contact'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  dbname: 'contacts',
  user: 'contactlistapp',
  host: 'localhost',
  password: 'contactlistapp'
  )

case ARGV[0]
when 'help'
  puts 'Here is a list of available commands: 
  new  - Create a new contact
  update - Update a contact
  list - List all contacts
  show[id] - Show a contact by id number
  lastname[last name] - Find by last name
  firstname[first name] - Find by first name
  email - Find by email
  delete[id] - delete a contact by id number'

when 'new'
  ARGV.clear
  print 'Enter first name: '
  first_name = gets.chomp
  print 'Enter last name: '
  last_name = gets.chomp
  print 'Enter Email: '
  email = gets.chomp
  contact = Contact.create(firstname: first_name, lastname: last_name, email: email)
  p 'Contact added'


when 'list'
  Contact.all.map do |contact|
    puts 'Name: ' + contact.firstname + ' ' + contact.lastname + ' || ' 'Email: ' + contact.email
  end

when 'show'
  if !ARGV[1].nil?
    p Contact.find(ARGV[1]) 
  end


when 'update'
  ARGV.clear
  p 'Enter email of contact to update: ' 
  email = gets.chomp 
  ct_to_update = Contact.find_by_email(email)
  if ct_to_update == nil
    p 'Contact does not exist in database yet.'
  else
    print 'Enter first name: '
    first_name = gets.chomp
    print 'Enter last name: '
    last_name = gets.chomp
    print 'Enter Email: '
    email = gets.chomp
    ct_to_update = Contact.update(ct_to_update.id, firstname: first_name, lastname: last_name, email: email)
    ct_to_update.save
  end

when 'lastname' 
  print  'Enter last name: '
  ARGV.clear
  last_name = gets.chomp.to_s
  p Contact.where(lastname: last_name).take 

when 'firstname' 
  print  'Enter first name: '
  ARGV.clear
  first_name = gets.chomp.to_s
  p Contact.where(firstname: first_name).take 

when 'email' 
  print  'Enter last email: '
  ARGV.clear
  email = gets.chomp.to_s
  p Contact.where(email: email).take

when 'delete' 
  if !ARGV[1].nil?
    Contact.destroy(ARGV[1])
  end
end

