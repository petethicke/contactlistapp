
## TODO: Implement CSV reading/writing
# require 'csv'
class Db
 def self.connection
    puts "establishing connection ..."
    conn = PG.connect(
      dbname: 'd8v920oslptohj',
      port: 5432,
      user: 'iqwceaexuceehd',
      host: 'ec2-54-163-225-82.compute-1.amazonaws.com',
      password: 'h17nDKFtIz29TrgH0pjDjJVHVn'
      )
  end


end 


#Read file
# CSV.read('./contacts.csv')

#Write to file
