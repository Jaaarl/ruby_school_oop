require_relative 'student'

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
  student = Student.find(1)
  student.destroy
  puts "Student destroyed successfully!"
end

while true
  puts "Choose a number"
  puts "[1] Adds New Student"
  puts "[2] Deletes Student"
  puts "[3] Exit"
  case choice = gets.chomp.to_i
  when 1
    new_student
  when 2
    delete_student
  when 3
    exit
  end
end
