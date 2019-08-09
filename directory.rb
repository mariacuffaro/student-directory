def print_header
  puts "The students of Villains Academy"
  puts "------------"
end
def print(students)
  students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_footer(students)
  puts "Overall we have #{students.count} great students"
end
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  #gets the first name
  name = gets.chomp
  # while the array is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # gets another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end
def interactive_menu
  students = []
  loop do
    # print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9.Exit"
    # read the input and save to a variable
    selection = gets.chomp
    # do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end
#nothing happens until we call the methods
interactive_menu

