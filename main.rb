require_relative 'student'

def new_user
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

new_user