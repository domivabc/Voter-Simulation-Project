=begin

Developer: Vagner Domingues
Date: 02/24/2021
This is a CRUD application to manage voters and politians in the system.

=end

require_relative 'voter.rb'
require_relative 'politician.rb'


message = nil
election = Array.new

####################################################
# P r i n t    H e a d e r    M e t h o d
###################################################
def print_header ( message )
    50.times{print "*"}
    print "\n"
    puts "*  #{message}  *".center(50)
    50.times{print "*"}
    print "\n"
end

##################################################
# M a i n     M e n u     M e t h o d
##################################################
def main_menu
    puts "     (C) Create"
    puts "     (R) Retrieve"
    puts "     (U) Update"
    puts "     (D) Delete"
    puts "     (Q) Quit"
    print "     Choose (C) or (R) or (U) or (D) or (Q) : "
end

##################################################
# M a i n     M e n u     M e t h o d
##################################################
def get_role
    puts "     (P) Politician" 
    puts "     (V) Voter"
    print "     Choose (P) or (V) : "
    role = nil
    
    loop do
        role = gets.chomp
        
        case role
        
        when "P"
            role = "P"
            break
        when "V"
            role = "V"
            break
        else
            puts "     #{role} is an invalid option! "
        end 
        
        puts "     (P) Politician" 
        puts "     (V) Voter"
        print "     Choose (P) or (V) : " 
    
    end
    
    role
end 


##################################################
#        G e t    N a m e    M e t h o d
##################################################
def get_name
    
    name = nil
    
    until name =~ /^[A-Za-z]+$/i
        print "Enter Name : "
        name = gets.chomp
        if not name =~ /^[A-Za-z]+$/i
            puts "Name MUST be alphabetic!"
        end    
    end
    
    name
    
end

############################################################
#  G e t    V o t e r   A f f i l i a t i o n   M e t h o d
############################################################
def get_voter_affiliation
    
    aff = nil
    puts "     (L) Liberal" 
    puts "     (C) Conservative"
    puts "     (T) Tea Party"
    puts "     (S) Socialist"
    puts "     (N) Neutral"
    print "     Choose (L) or (C) or (T) or (S) or (N) : " 
    
    loop do
        aff = gets.chomp
        
        case aff
        
        when "L"
            aff = "Liberal"
            break
        when "C"
            aff = "Conservative"
            break
        when "T"
            aff = "Tea Party"
            break
        when "S"
            aff = "Socialist"
            break
        when "N"
            aff = "Neutral"
            break
        else
            print "#{aff} is an invalid option\nChoose (L) or (C) or (T) or (S) or (N) "
        end 
        
        puts "     (L) Liberal" 
        puts "     (C) Conservative"
        puts "     (T) Tea Party"
        puts "     (S) Socialist"
        puts "     (N) Neutral"
        print "     Choose (L) or (C) or (T) or (S) or (N) : " 
    
    end
    
    aff
    
end 

#######################################################################
#  G e t    P o l i t i c i a n    A f f i l i a t i o n   M e t h o d
#######################################################################
def get_politician_affiliation
    
    aff = nil
    puts "     (D) Democratic" 
    puts "     (R) Republican"
    print "     Choose (D) or (R) : " 
    
    loop do
        aff = gets.chomp
        
        case aff
        
        when "D"
            aff = "Democrat"
            break
        when "R"
            aff = "Republican"
            break
        else
            print "     #{aff} is an invalid option\n     Choose (D) or (R) "
        end 
        
        puts "     (D) Democratic" 
        puts "     (R) Republican"
        print "     Choose (D) or (R) : " 
    
    end
    
    aff
    
end 
##################################################
#        C r e a t e    M e t h o d
##################################################
def retrieve_data ( election )
    
    print_header ( " Politicians and Voters ")
    
    election.each do |person|
        person.print_info
        
    end
    
    if election.empty?
        puts " "
        puts "No Data Available".center(30)
        puts " "
    end    
    
end    
##################################################
#        C r e a t e    M e t h o d
##################################################
def create ( role, election )
    
    name = nil
    v_affiliation = nil
    
    if role == "V"
        message = "Create Voter Record"
        print_header ( message )
        name = get_name
        v_affiliation = get_voter_affiliation
        v = Voter.new(name, v_affiliation)
        election.push(v)
        puts "Record for #{name} Successfully Created!"
    else
        message = "Create Politician Record"
        print_header ( message )
        name = get_name
        p_affiliation = get_politician_affiliation
        p = Politician.new(name, p_affiliation)
        election.push(p)
        puts "Record for #{name} Successfully Created!"
    end 
    
end 

##################################################
#    S e a r c h    D a t a    M e t h o d
##################################################
def delete ( election ) 
    name = nil
    print "Who would you like to delete? "
    name = gets.chomp
    
     election.each_with_index do |person, index|
         
        if name == person.name
            election.delete_at(index)
            puts "Record Successfully Deleted!"
        end
        
    end
    
end    
##################################################
#    S e a r c h    D a t a    M e t h o d
##################################################
def update ( election ) 
    
    name = nil
    print "Who would you like to update? "
    name = gets.chomp
    
    election.each_with_index do |person, index|
        if name == person.name
            puts "New Data for Record #{index}: "
            puts "The index is #{index} and class = #{person.class.name} "
            new_name = get_name
            person.name = new_name
            
            if person.class.name == "Voter"
                new_voter_affiliation = get_voter_affiliation
                person.political_affiliation = new_voter_affiliation
            else 
                new_party_affiliation = get_politician_affiliation
                person.party_affiliation = new_party_affiliation
            end 
        end
    end
    
end    
    

##################################################
#            M a i n     M e t h o d
##################################################
print_header ( "Voting System" )

main_menu

menu_option = nil

loop do
    menu_option = gets.chomp
    
    case menu_option
    
    when "C"
        role = nil
        print_header ( "Voting System" )
        role = get_role
        create(role, election)
    when "R"
        retrieve_data ( election )
    when "U"
        update ( election )
    when "D"
        delete ( election )
    when "Q"
        break
    else
        puts "     #{menu_option} is an invalid option\n     Choose (C) or (R) or (U) or (D) or (Q) "
    end 
    
    print_header ( "Voting System".center(30) )
    main_menu
    
end


