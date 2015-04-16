require 'active_record'

class Contact < ActiveRecord::Base
  validates :email, uniqueness: {message: "A user with this email already exists"}
end
