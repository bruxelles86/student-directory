# let's put all the students into an array

students = [
    {name: "Dr. Hannibal Lecter", cohort: :november, age: 50, nationality: :US},
    {name: "Darth Vader", cohort: :november, age: 62, nationality: :US},
    {name: "Nurse Ratched", cohort: :november, age: 45, nationality: :US},
    {name: "Michael Corleone", cohort: :november, age: 70, nationality: :Italian},
    {name: "Alex DeLarge", cohort: :november, age: 60, nationality: :UK},
    {name: "The Wicked Witch of the West", cohort: :november, age: 60, nationality: :US},
    {name: "Terminator", cohort: :november, age: 35, nationality: :US},
    {name: "Freddy Krueger", cohort: :november, age: 45, nationality: :US},
    {name: "The Joker", cohort: :november, age: 30, nationality: :US},
    {name: "Joffrey Baratheon", cohort: :november, age: 15, nationality: :UK},
    {name: "Norman Bates", cohort: :november, age: 32, nationality: :US}
    ]

def print_header
puts "The students of Villains Academy"
puts "-------------"
end

def print(students)
    students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_nationality_age(students)
    students.each do |student|
        puts "#{student[:age]} #{student[:nationality]}"
    end
end

def print_with_loop(students)
    counter = 0
    while counter != students.count 
        puts students[counter][:name]
        counter += 1
    end
end

def print_with_index(students)
   students.each.with_index(1) do |student, index|
        puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
   end
end

def print_by_first_letter(students)
   puts "Please type a letter of the alphabet to show the names of all students starting with that letter"
   letter = $stdin.gets.chomp.upcase
   students.each do |student|
    student_first_letter = student[:name][0]
        if student_first_letter == letter
            puts student[:name]
        else
            next
        end
    end
end

def print_shorter_names(students)
    puts "The following students have names shorter than 12 characters"
    students.each do |student|
    if student[:name].length < 12
        puts student[:name]
    else
        next
    end
end
end

def print_footer(students)
    puts "Overall we have #{students.count} great students"
end
#nothing happens until we call the methods

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the first name
    name = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
        # add the student hash to the array
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp
    end
# return the array of students 
    students 
end

# students = input_students
print_header
print_with_loop(students)
print_nationality_age(students)
# print_shorter_names(students)
# print_by_first_letter(students)
# print_with_index(students)
# print(students)
print_footer(students)