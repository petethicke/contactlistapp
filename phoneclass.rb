
class Phone
  attr_accessor :type, :numbers

  def initialize(type, numbers)
    @type = type
    @numbers = numbers
  end

  def to_s
    "#{@type}: #{numbers}"
  end

end