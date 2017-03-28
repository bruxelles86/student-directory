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
puts "The students of Villains Academy".center(150)
puts "-------------".center(150)
end

def print(students)
    students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)".center(150)
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
        name = gets.chomp
        puts "And now please enter the cohort of that student."
        cohort = gets.chomp.downcase
        if name.empty?
            name = "NO NAME RECORDED"
        end
        
        if cohort.empty?
            cohort = "NO COHORT RECORDED"
        end
        
        
        # add the student hash to the array
        students << {name: name, cohort: cohort.to_sym}
        puts "Now we have #{students.count} students".center(150)
    
        puts "Type 'end' if you've finished, or any other input to continue and add more students."
        ends = gets.chomp
        if ends.downcase == "end"
            ends = true
        else 
            ends = false
        end
        
    end
    puts students
# return the array of students 
    students 
end

students = input_students
print_header
print_with_loop(students)
# print_nationality_age(students)
# print_shorter_names(students)
# print_by_first_letter(students)
# print_with_index(students)
# print(students)
print_footer(students)