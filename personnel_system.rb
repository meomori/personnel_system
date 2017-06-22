class Employee
	attr_accessor :name, :role, :location

	def initialize(name, role, location)
		@name = name
		@role = role
		@location = location
	end

	def rename(new_name)
		@name = new_name
	end

	def rejob(new_job)
		@role = new_job
	end

	def transfer(new_loc)
		@location = new_loc
	end
end

#This is a random comment by Heather
def main_menu
	puts "\n"
	puts "Welcome to the Employee Database! Please select an appropriate option."
	puts "-----------------------------"
	puts "1) Create a new employee record."
	puts "2) View an existing record."
	puts "3) Modify an existing record."
	puts "4) Exit database."

	option = gets.chomp.to_i

	if option == 1
		create_record
		main_menu
	elsif option == 2
		view_record
		main_menu
	elsif option == 3
		mod_record
		main_menu
	elsif option == 4
		system("cls")
		puts "You have exited the database."
		puts "\n"
	else 
		puts "You selected an invalid option. Try again."
		puts "\n"
		main_menu
	end
end

def create_record
	puts "\n"
	puts "Fill in the appropriate information."
	print "Name: "
	name = gets.chomp.upcase
	print "Occupation: "
	role = gets.chomp.upcase
	print "Location: "
	location = gets.chomp.upcase
	puts "\n"
	system("cls")

	new_entry = Employee.new(name, role, location)
	@database.push(new_entry)

	puts "Your new entry has been created."
	puts "Name: #{name}"
	puts "Role: #{role}"
	puts "Location: #{location}"
end

def view_record
	puts "\n"
	puts "Enter the name of the record you would like to view: "
	view = gets.chomp.upcase
	system("cls")

	@database.each do |a|
		if a.name == view
			puts "Entry found."
			puts "Name : #{a.name}"
			puts "Role: #{a.role}"
			puts "Location: #{a.location}"
		else
			puts "No entries found with the name '#{view}."
		end
	end
end

def mod_record
	system("cls")
	puts "Enter the following information for the entry you would like to modify."
	print "Name: "
	name = gets.chomp.upcase
	print "Role: "
	role = gets.chomp.upcase
	print "Location: "
	location = gets.chomp.upcase
	puts "\n"

	@database.each do |a|
		if a.name == name && a.role == role && a.location == location
			puts "Entry found."
			puts "Select an appropriate option."
			puts "-----------------------------"
			puts "1) Modify the entry's name."
			puts "2) Modify the entry's role."
			puts "3) Modify the entry's location."
			puts "4) Return to the main menu."
			puts "\n"
			option = gets.chomp.to_i

			if option == 1
				print "Enter the entry's new name: "
				new_name = gets.chomp.upcase
				@database.each do |g|
					if g.name == name && g.role == role && g.location == location
						g.rename(new_name)
						system("cls")
						puts "The entry's new name is now #{g.name}."
					end
				end
			elsif option == 2
				print "Enter the entry's new role: "
				new_role = gets.chomp.upcase
				@database.each do |g|
					if g.name == name && g.role == role && g.location == location
						g.rejob(new_role)
						system("cls")
						puts "The entry's new role is now #{g.role}."
					end
				end
			elsif option == 3
				print "Enter the entry's new location: "
				new_location = gets.chomp.upcase
				@database.each do |g|
					if g.name == name && g.role == role && g.location == location
						g.transfer(new_location)
						system("cls")
						puts "The entry's new location is now #{g.location}."
					end
				end
			elsif option == 4
				puts "\n"
				main_menu
			else
				puts "Invalid selection. Please try again."
				mod_record
			end
		else
			puts "Entry was not found. Please try again."
			mod_record
		end
	end
end









@database = []
system("cls")
main_menu
