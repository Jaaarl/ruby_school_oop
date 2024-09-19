require_relative 'student'
require_relative 'course'
require_relative 'subject'
require_relative 'teacher'

def new_student
  student = Student.new
  puts "Enter name"
  student.id = Student.all.size + 1
  student.name = gets.chomp
  puts "Enter birth date"
  student.birth_date = gets.chomp
  puts "Enter email"
  student.email = gets.chomp
  puts "Enter phone number"
  student.phone_number = gets.chomp.to_i
  student.save
  puts student.display
  puts "Student added successfully!"
end

def delete_student
  student = Student.new
  puts "Enter the id of student to be deleted"
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
  puts "Enter course name"
  course.id = Course.all.size + 1
  course.name = gets.chomp
  course.save
  puts course.display
  puts "Course added successfully!"
end

def delete_course
  course = Course.new
  puts "Enter the id of course to be deleted"
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
  puts "Enter the id of subject to be deleted"
  subject = Subject.find(gets.chomp.to_i)
  if subject
    subject.destroy
    puts "Subject destroyed successfully!"
  else
    puts "Subject not found\n"
  end
end

def new_teacher
  teacher = Teacher.new
  puts "Enter name"
  teacher.id = Teacher.all.size + 1
  teacher.name = gets.chomp
  puts "Enter birth date"
  teacher.birth_date = gets.chomp
  puts "Enter email"
  teacher.email = gets.chomp
  puts "Enter phone number"
  teacher.phone_number = gets.chomp.to_i
  puts "Enter department"
  teacher.department = gets.chomp.to_i
  teacher.save
  puts teacher.display
  puts "Teacher added successfully!"
end

def delete_teacher
  teacher = Teacher.new
  puts "Enter the id of teacher to be deleted"
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
    puts "[1] Adds new student"
    puts "[2] Deletes student"
    choice_2 = gets.chomp.to_i
    case choice_2
    when 1
      new_student
    when 2
      delete_student
    else
      puts "Invalid choice"
    end
  elsif choice == 2
    puts "Choose a number"
    puts "[1] Adds new course"
    puts "[2] Deletes course"
    choice_3 = gets.chomp.to_i
    case choice_3
    when 1
      new_course
    when 2
      delete_course
    else
      puts "Invalid choice"
    end
  elsif choice == 3
    puts "Choose a number"
    puts "[1] Adds new subject"
    puts "[2] Deletes subject"
    choice_2 = gets.chomp.to_i
    case choice_2
    when 1
      new_subject
    when 2
      delete_subject
    else
      puts "Invalid choice"
    end
  elsif choice == 4
    puts "Choose a number"
    puts "[1] Adds new teacher"
    puts "[2] Deletes teacher"
    choice_2 = gets.chomp.to_i
    case choice_2
    when 1
      new_teacher
    when 2
      delete_teacher
    else
      puts "Invalid choice"
    end
  elsif choice == 5
    exit
  else
    puts "Invalid choice"
  end
end


