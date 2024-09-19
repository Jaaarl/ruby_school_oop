require_relative 'student'
require_relative 'course'
require_relative 'subject'
require_relative 'teacher'

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
    puts "Student not found\n"
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

def delete_course
  course = Course.new
  puts "Enter the Id of course to be deleted"
  course = Course.find(gets.chomp.to_i)
  if course
    course.destroy
    puts "Course destroyed successfully!"
  else
    puts "Course not found\n"
  end
end

def new_subject
  subject = Subject.new
  puts "Enter subject name"
  subject.id = Subject.all.size + 1
  subject.name = gets.chomp
  subject.save
  puts subject.display
  puts "Subject added successfully!"
end

def delete_subject
  subject = Subject.new
  puts "Enter the Id of course to be deleted"
  subject = Subject.find(gets.chomp.to_i)
  if subject
    subject.destroy
    puts "Subject destroyed successfully!"
  else
    puts "User not found\n"
  end
end

def new_teacher
  teacher = Teacher.new
  puts "Enter Name"
  teacher.id = Teacher.all.size + 1
  teacher.name = gets.chomp
  puts "Enter Birth date"
  teacher.birth_date = gets.chomp
  puts "Enter Email"
  teacher.email = gets.chomp
  puts "Enter Phone Number"
  teacher.phone_number = gets.chomp.to_i
  puts "Enter Department"
  teacher.department = gets.chomp.to_i
  teacher.save
  puts teacher.display
  puts "Teacher added successfully!"
end

def delete_teacher
  teacher = Teacher.new
  puts "Enter the Id of Teacher to be deleted"
  teacher = Teacher.find(gets.chomp.to_i)
  if teacher
    teacher.destroy
    puts "Teacher destroyed successfully!"
  else
    puts "Teacher not found\n"
  end
end


while true
  puts "Choose a number"
  puts "[1] Student management"
  puts "[2] Course management"
  puts "[3] Subject management"
  puts "[4] Teacher management"
  puts "[5] Exit"
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
      delete_course
    else
      puts "invalid Course"
    end
  elsif choice == 3
    puts "Choose a number"
    puts "[1] Adds New Subject"
    puts "[2] Deletes Subject"
    choice_2 = gets.chomp.to_i
    case choice_2
    when 1
      new_subject
    when 2
      delete_subject
    else
      puts "invalid choice"
    end
  elsif choice == 4
    puts "Choose a number"
    puts "[1] Adds New Teacher"
    puts "[2] Deletes Teacher"
    choice_2 = gets.chomp.to_i
    case choice_2
    when 1
      new_teacher
    when 2
      delete_teacher
    else
      puts "invalid choice"
    end
  elsif choice == 5
    exit
  else
    puts "invalid choice"
  end
end


