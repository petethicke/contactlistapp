require 'active_record'

class Db
   def self.connection
    #ActiveRecord::Base.logger = Logger.new(STDOUT)
    puts "establishing connection ..."
    conn = ActiveRecord::Base.establish_connection(
      adapter: 'postgresql',
      dbname: 'd8v920oslptohj',
      port: 5432,
      user: 'iqwceaexuceehd',
      host: 'ec2-54-163-225-82.compute-1.amazonaws.com',
      password: 'h17nDKFtIz29TrgH0pjDjJVHVn'
      )
  end
end 

