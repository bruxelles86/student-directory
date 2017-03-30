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
    seek_name
    name = STDIN.gets.chomp
    return if name.empty?
    seek_cohort    
    cohort = STDIN.gets.chomp.downcase
    
    while true
        # add the student hash to the array
        add_students(name, cohort)
        student_count
        seek_name
        name = STDIN.gets.chomp
        break if name.empty?
        seek_cohort
        cohort = STDIN.gets.chomp.downcase
    end
end

def seek_name
    puts "Please enter the next student's name. Press enter to finish."
end

def seek_cohort
    puts "And now please enter the cohort of that student."
end

def student_count
    if @students.count == 1
        puts "Now we have #{@students.count} student".center(150)
    else
        puts "Now we have #{@students.count} students".center(150)
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
       process(STDIN.gets.chomp)
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
            puts "Displaying students..."
            show_students
        when "3"
            save_students  
        when "4"
            load_students
        when "9"
            Puts "Exiting the program"
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
    new_file = []
    file.close
    file = File.open("students.csv", "r+")
    file.readlines.each do |line|
        name, cohort = line.chomp.split(',')
        new_file << {name: name, cohort: cohort.to_sym}
        end
        counter = 0
        file_saved = false
    new_file.each do |line|
        if line == @students[counter] 
            counter += 1
            file_saved = true#
        end
    end
    puts "\nFile saved successfully\n\n" if file_saved == true
    file.close
end

def load_students
    puts "Please enter the name of the file you would like to load"
    filename = STDIN.gets.chomp
    file = File.open(filename, "r")
    file.readlines.each do |line|
        name, cohort = line.chomp.split(',')
        add_students(name, cohort)
    end
    file.close
    puts "File loaded"
end

def try_load_students
    filename = ARGV.first # first argument from the command line
    filename = "students.csv" if filename.nil? # get out of the method if it isn't given
    if File.exists?(filename) # if it exists
        load_students(filename)
        puts "Loaded #{@students.count} from #{filename}"
    else # if it doesn't exist
        puts "Sorry, #{filename} doesn't exist."
        exit # quit the program
    end
end

def add_students(name, cohort)
    @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
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