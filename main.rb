require_relative 'student'
require_relative 'course'

def new_student
  student = Student.new
  puts "Enter Name"
  student.id = Student.all.size + 1
  student.name = gets.chomp
  puts "Enter birth date"
  student.birth_date = gets.chomp
  puts "Enter Email"
  student.email = gets.chomp
  puts "Enter Phone Number"
  student.phone_number = gets.chomp.to_i
  student.save
  puts student.display
  puts "Student added successfully!"
end

def delete_student
  student = Student.new
  puts "Enter the Id of student to be deleted"
  student = Student.find(gets.chomp.to_i)
  if student
    student.destroy
    puts "Student destroyed successfully!"
  else
    puts "User not found\n"
  end
end

def new_course
  course = Course.new
  puts "Enter course Name"
  course.id = Course.all.size + 1
  course.name = gets.chomp
  course.save
  puts course.display
  puts "Course added successfully!"
end

while true
  puts "Choose a number"
  puts "[1] Student Management"
  puts "[2] Course management"
  puts "[3] Exit"
  choice = gets.chomp.to_i
  if choice == 1
    puts "Choose a number"
    puts "[1] Adds New Student"
    puts "[2] Deletes Student"
    choice_2 = gets.chomp.to_i
    case choice_2
    when 1
      new_student
    when 2
      delete_student
    else
      puts "invalid choice"
    end
  elsif choice == 2
    puts "Choose a number"
    puts "[1] Adds New Course"
    puts "[2] Deletes Course"
    choice_3 = gets.chomp.to_i
    case choice_3
    when 1
      new_course
    when 2
      puts "Deletes Course"
    else
      puts "invalid Course"
    end
  elsif choice == 3
    exit
  else
    puts "invalid choice"
  end
end


