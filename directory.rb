@students = []

def print_header
puts "The students of Villains Academy".center(150)
puts "-------------".center(150)
end

def print_students_list()
    student_array = @students
    student_array.each do |student|
        if student[:name] != "NO NAME RECORDED"
        puts "#{student[:name]} (#{student[:cohort]} cohort)".center(150)
        else
            next
        end
    end
end

def print_nationality_age
    @students.each do |student|
        puts "#{student[:age]} #{student[:nationality]}".center(150)
    end
end

def print_with_loop
    counter = 0
    while counter != @students.count 
        puts @students[counter][:name].center(150)
        counter += 1
    end
end

def print_with_index
   @students.each.with_index(1) do |student, index|
        puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(150)
   end
end

def print_by_first_letter
   puts "Please type a letter of the alphabet to show the names of all students starting with that letter".center(150)
   letter = $stdin.gets.chomp.upcase
   @students.each do |student|
    student_first_letter = student[:name][0]
        if student_first_letter == letter
            puts student[:name].center(150)
        else
            next
        end
    end
end

def print_shorter_names
    puts "The following students have names shorter than 12 characters".center(150)
    @students.each do |student|
    if student[:name].length < 12
        puts student[:name].center(150)
    else
        next
    end
end
end

def print_footer
    puts "Overall we have #{@students.count} great students".center(150)
end
#nothing happens until we call the methods

def input_students
    # create an empty array     
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
        @students << {name: name, cohort: cohort.to_sym}
        if @students.count == 1
            puts "Now we have #{@students.count} student".center(150)
        else
            puts "Now we have #{@students.count} students".center(150)
        end
    
        puts "Type 'end' if you've finished, or any other input to continue and add more students."
        ends = gets.chomp
        if ends.downcase == "end"
            ends = true
        else 
            ends = false
        end
    end
end

def print_by_cohort(cohort)
    @students.each do |student|
        if cohort.to_sym == student[:cohort]
            puts "#{student[:name]}, #{student[:cohort]}"
        else
           next
        end
    end
end

def interactive_menu
    loop do
       print_menu
       process(gets.chomp)
    end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit"
end

def show_students
    print_header
    print_students_list
    print_footer
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
            exit
        else
            puts "I don't know what you mean, try again"
    end
end

def save_students
   # open the file for writing
   file = File.open("students.csv", "w")
   # iterate over the array of students
   @students.each do |student|
       student_data = [student[:name], student[:cohort]]
       csv_line = student_data.join(",")
       file.puts csv_line
    end
    file.close
end

def load_students
    file = File.open("students.csv", "r")
    file.readlines.each do |line|
        name, cohort = line.chomp.split(',')
        @students << {name: name, cohort: cohort.to_sym}
    end
    file.close
end

interactive_menu
# students = input_students
# print_header
# print_with_loop
# print_by_cohort("march")
# print_nationality_age
# print_shorter_names
# print_by_first_letter
# print_with_index
# print_students_list
# print_footer