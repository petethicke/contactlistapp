#require 'pry'

require_relative 'contact'
#require_relative 'contact_database'
#require_relative 'phoneclass'

  def self.connection
    puts "establishing connection ..."
    @@conn = PG.connect(
      dbname: 'd7ph26kgbqdu87',
      port: 5432,
      user: 'ughozmqwxkndvs',
      host: 'ec2-54-83-33-196.compute-1.amazonaws.com',
      password: '8fqJHq16203QSMDBRqxhnnvdgg'
      )
    connection
  end



case ARGV[0]
when 'help'
  puts 'Here is a list of available commands: 
  new  - Create a new contact
  list - List all contacts
  show - Show a contact
  find - Find a contact'

when 'new'
  #phone_numbers = []
  ARGV.shift
  print 'Enter Email: '
  @email = gets.chomp

  #if Contact.emailpresent?(email)
    #puts 'Contact with that email already exists!'
    #exit
  #end
  print 'Enter first name: '
  @first_name = gets.chomp
  print 'Enter last name: '
  @last_name = gets.chomp
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
  contact = Contact.new(@first_name, @last_name, @email)
  contact.save
end
# when 'list'
#   Contact.all 
# end

# case
# when ARGV[0] == 'show' && !ARGV[1].nil?
#   Contact.show(ARGV[1])
# when ARGV[0] == 'find' && !ARGV[1].nil?
#   Contact.find(ARGV[1])
# end






