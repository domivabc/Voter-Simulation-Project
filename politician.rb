class Politician
  attr_reader :name, :party_affiliation 
  attr_writer :name, :party_affiliation   # creates the setter methods     
  
  def initialize(name, party_affiliation)
    @name = name
    @party_affiliation = party_affiliation
  end
  
  def print_info
    puts "   Politician , #{@name.ljust(15)}, #{@party_affiliation.ljust(15)}".ljust(40)
  end
end