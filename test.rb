@students = [
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

def printing
    student_array = @students
    student_array.each do |student|
        if student[:name] != "NO NAME RECORDED"
        puts "#{student[:name]} (#{student[:cohort]} cohort)".center(150)
        else
            next
        end
    end
end

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

def interactive_menu
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
            input_students
        when "2"
            printing
        when "9"
            exit # this will causes the program to terminate
        else 
            puts "I don't know what you meant, try again"
       end
    end
end

interactive_menu