require_relative 'contact'
require_relative 'contact_database'
require_relative 'phoneclass'

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
    if Contact.emailpresent?(@email)
      p 'Contact with that email already exists!'
      exit
    end
    print 'Enter full name: '
    @name = gets.chomp
      begin
        puts 'Phone number? (y/n)'
        if STDIN.gets.chomp.downcase == 'y'
          phone = true
          puts 'Enter the type'
          type = STDIN.gets.chomp
          puts 'Enter the number'
          digits = STDIN.gets.chomp
          numbers << Phone.new(type, digits)
          puts numbers.class
          puts numbers
        else
          phone = false
        end
      end while phone == true
      puts Contact.create(contact_name, contact_email, numbers)
    end


    end
    Contact.create(@name, @email)


  when 'list'
    Contact.all 
  end


case
  when ARGV[0] == 'show' && !ARGV[1].nil?
    Contact.show(ARGV[1])
  when ARGV[0] == 'find' && !ARGV[1].nil?
    Contact.find(ARGV[1])
  end

#Phone.get_number(@number, @type)





