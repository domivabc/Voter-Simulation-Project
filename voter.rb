class Voter
  attr_reader :name, :political_affiliation 
  attr_writer :name, :political_affiliation   # creates the setter methods     
  
  def initialize(name, political_affiliation)
    @name = name
    @political_affiliation = political_affiliation
  end
  
  def print_info
    puts "   Voter      , #{@name.ljust(15)}, #{@political_affiliation.ljust(15)}".ljust(40)
  end
end