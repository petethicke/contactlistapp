# class Phone 
  
#   attr_accessor :number, :type

#   def initialize(number, type)
#     @number = number
#     @type = type
#   end

#   def self.get_number
#     CSV.open('contacts.csv', 'a') do |row|
#       line = []
#       line << Contact.name
#       line << Contact.email
#       Contact.numbers.each do |number|
#         line << "#{type} : #{number}"
#       end
#       csv << line
#     end
#   end

#   def self.return_number

#   end


# end

class PhoneNumber
  attr_accessor :type, :digits

  def initialize(type, number)
    @type = type
    @number = number
  end

  def to_s
    "#{@type}: #{number}"
  end

end