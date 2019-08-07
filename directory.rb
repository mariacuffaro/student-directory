# let's put all students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vadar",
  "Nurse Rached",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
  ]
def print_header
  puts "The students of Villains Academy"
  puts "------------"
end
def print_names(names)
  names.each do |name|
    puts name
  end
end
def print_footer(students)
  puts "Overall we have #{students.count} great students"
end
#nothing happens until we call the methods
print_header
print_names(students)
print_footer(students)
