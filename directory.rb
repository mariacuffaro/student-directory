@students = [] # and empty array accessible to all methods
@menu = ["1. Input the students",
  "2. Show the students",
  "3. Save the students to csv",
  "4. Load the list from students.csv",
  "9. Exit"
  ]
@filename = ARGV.first # first argument from the command line
  
def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def print_students_list
  @students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall we have #{@students.count} great students"
end

def add_student(name)
  # add the student hash to the array
  @students << {name: name, cohort: :november}
end
  
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = user_input
  while !name.empty? do
    add_student(name)
    puts "Now we have #{@students.count} students"
    name = user_input
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    file.puts [student[:name], student[:cohort]].join(",")
  end
  file.close
end

def load_students
  file = File.open(@filename, "r")
  file.readlines.each do |line|
    name = line.chomp.split(",")[0]
    add_student(name)
  end
  file.close
end

def user_input
  STDIN.gets.chomp
end

def print_menu
  @menu.each do |menu_item|
    puts menu_item
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(user_input)
  end
end

def try_load_students
  @filename.nil? ? @filename = "students.csv" : @filename = @filename
  if File.exists?(@filename) # if it exists
    load_students
    puts "Loaded #{@students.count} from #{@filename}"
  else
    puts " Sorry #{@filename} doesn't exist"
    exit
  end
end
#nothing happens until we call the methods

try_load_students
interactive_menu

