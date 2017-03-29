# let's put all the students into an array

students = [
    {name: "Dr. Hannibal Lecter", cohort: :november, age: 50, nationality: :US},
    {name: "Darth Vader", cohort: :november, age: 62, nationality: :US},
    {name: "Nurse Ratched", cohort: :april, age: 45, nationality: :US},
    {name: "Michael Corleone", cohort: :march, age: 70, nationality: :Italian},
    {name: "Alex DeLarge", cohort: :march, age: 60, nationality: :UK},
    {name: "The Wicked Witch of the West", cohort: :november, age: 60, nationality: :US},
    {name: "Terminator", cohort: :november, age: 35, nationality: :US},
    {name: "Freddy Krueger", cohort: :october, age: 45, nationality: :US},
    {name: "The Joker", cohort: :november, age: 30, nationality: :US},
    {name: "Joffrey Baratheon", cohort: :november, age: 15, nationality: :UK},
    {name: "Norman Bates", cohort: :november, age: 32, nationality: :US}
    ]

def print_header
puts "The students of Villains Academy".center(150)
puts "-------------".center(150)
end

def print(students)
    students.each do |student|
        if student[:name] != "NO NAME RECORDED"
        puts "#{student[:name]} (#{student[:cohort]} cohort)".center(150)
        else
            next
        end
    end
end

def print_nationality_age(students)
    students.each do |student|
        puts "#{student[:age]} #{student[:nationality]}".center(150)
    end
end

def print_with_loop(students)
    counter = 0
    while counter != students.count 
        puts students[counter][:name].center(150)
        counter += 1
    end
end

def print_with_index(students)
   students.each.with_index(1) do |student, index|
        puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(150)
   end
end

def print_by_first_letter(students)
   puts "Please type a letter of the alphabet to show the names of all students starting with that letter".center(150)
   letter = $stdin.gets.chomp.upcase
   students.each do |student|
    student_first_letter = student[:name][0]
        if student_first_letter == letter
            puts student[:name].center(150)
        else
            next
        end
    end
end

def print_shorter_names(students)
    puts "The following students have names shorter than 12 characters".center(150)
    students.each do |student|
    if student[:name].length < 12
        puts student[:name].center(150)
    else
        next
    end
end
end

def print_footer(students)
    puts "Overall we have #{students.count} great students".center(150)
end
#nothing happens until we call the methods

def input_students
    # create an empty array     
    students = []
    ends = false

    # while the name is not empty, repeat this code
    while ends == false do
        
        puts "Please enter the next student's name."
        name = gets.rstrip
        puts "And now please enter the cohort of that student."
        cohort = gets.rstrip.downcase
        if name.empty?
            name = "NO NAME RECORDED"
        end
        
        if cohort.empty?
            cohort = "NO COHORT RECORDED"
        end
        
        
        # add the student hash to the array
        students << {name: name, cohort: cohort.to_sym}
        if students.count == 1
            puts "Now we have #{students.count} student".center(150)
        else
            puts "Now we have #{students.count} students".center(150)
        end
    
        puts "Type 'end' if you've finished, or any other input to continue and add more students."
        ends = gets.chomp
        if ends.downcase == "end"
            ends = true
        else 
            ends = false
        end
        
    end
# return the array of students 
    students 
end

def print_by_cohort(students, cohort)
    students_array = students
    students_array.each do |student|
        if cohort.to_sym == student[:cohort]
            puts "#{student[:name]}, #{student[:cohort]}"
        else
           next
        end
    end
end

def interactive_menu
    students = []
    loop do
       # 1. print the menu and ask the user what to do
       puts "1. Input the students"
       puts "2. Show the students"
       puts "9. Exit" # 9 because we'll be adding more items
       # 2. read the input and save it into a variable
       selection = gets.chomp
       # 3. do what the user has asked
       case selection
        when "1"
            students = input_students
        when "2"
            print_header
            print(students)
            print_footer(students)
        when "9"
            exit # this will causes the program to terminate
        else 
            puts "I don't know what you meant, try again"
       end
    end
end

interactive_menu
# students = input_students
# print_header
# print_with_loop(students)
# print_by_cohort(students, "march")
# print_nationality_age(students)
# print_shorter_names(students)
# print_by_first_letter(students)
# print_with_index(students)
# print(students)
# print_footer(students)