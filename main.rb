require_relative 'student'
require_relative 'course'
require_relative 'subject'
require_relative 'teacher'
require_relative 'course_subject'
require_relative 'student_subject'

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
  puts "List of courses"
  Course.all.each do |course|
    if course.deleted_at == nil
      puts course.display
    end
  end
  puts "Enter Course ID"
  student.course_id = gets.chomp.to_i
  student.deleted_at = nil

  CourseSubject.all.each do |subject|
    if subject.course_id == student.course_id
      student_subject = StudentSubject.new
      student_subject.id = StudentSubject.all.size + 1
      student_subject.subject_id = subject.subject_id
      student_subject.save
    end
  end
  student.save
  puts student.display
  puts "Student added successfully!"
end

def update_student
  student = Student.new
  puts "Enter ID to Edit"
  student = Student.find(gets.chomp.to_i)
  if student == nil
    puts "User Not found"
  else
    student.save
  end
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

def display_student
  puts "List of Students"
  Student.all.each do |student|
    if student.deleted_at == nil
      puts student.display
    end
  end
  puts "Enter the student id you want see its subject"
  student = Student.find(gets.chomp.to_i)
  if student
    puts "This are the subjects"
    CourseSubject.all.each do |index|
      if index.course_id == student.course_id
        subject = Subject.find(index.subject_id)
        print "#{subject.name}, "
      end
    end
    print "\n"
  else
    puts "Student not found"
  end
end

def new_course
  course = Course.new
  puts "Enter course name"
  course.id = Course.all.size + 1
  course.name = gets.chomp
  course.deleted_at = nil
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

def update_course
  course = Course.new
  puts "Enter ID to Edit"
  course = Course.find(gets.chomp.to_i)
  if course == nil
    puts "User Not found"
  else
    course.save
  end
end

def display_course
  puts "List of courses"
  Course.all.each do |course|
    if course.deleted_at == nil
      puts course.display
    end
  end
  puts "Enter Course ID"
  id = gets.chomp.to_i
  course = Course.find(id)
  if course
    puts course.display
    menu_2 = true
    while menu_2 == true
      puts "[1] Add subject"
      puts "[2] Remove subject"
      puts "[3] View All Students belong to this course"
      puts "[4] View All Subject belong to this course"
      puts "[5] Back to course management"
      case choice_3 = gets.chomp.to_i
      when 1
        puts "List of Subject"
        Subject.all.each do |subject|
          if subject.deleted_at == nil
            puts subject.display
          end
        end
        puts "Enter the subject ID you want to add to course"
        course_subject = CourseSubject.new
        course_subject.id = CourseSubject.all.size + 1
        course_subject.course_id = course.id
        course_subject.subject_id = gets.chomp.to_i
        course_subject.save
      when 2
        CourseSubject.all.each do |record|
          puts record.display
        end
        puts "Enter the subject ID you want to delete to course"
        id = gets.chomp.to_i
        subject = CourseSubject.find(id)
        if subject
          subject.destroy
          puts "subject destroyed successfully"
        else
          puts "subject not found"
        end
      when 3
        puts "The Students belong to this course"
        student = Course.new
        student.id = id
        student.students.each do |s|
          s.display
        end
      when 4
        subject = Course.new
        subject.id = id
        puts "the subjects are"
        subject.subjects.each do |s|
          name = Subject.find(s.subject_id)
          print "#{ name.name }, "
        end
        print "\n"
      when 5
        menu_2 = false
      end
    end
  else
    puts "Course not found"
  end
end

def new_subject
  subject = Subject.new
  puts "Enter subject name"
  subject.id = Subject.all.size + 1
  subject.name = gets.chomp
  subject.deleted_at = nil
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

def update_subject
  subject = Subject.new
  puts "Enter ID to Edit"
  subject = Subject.find(gets.chomp.to_i)
  if subject == nil
    puts "User Not found"
  else
    subject.save
  end
end

def display_subject
  puts "List of Subjects"
  Subject.all.each do |subject|
    if subject.deleted_at == nil
      puts subject.display
    end
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
  teacher.department = gets.chomp
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

def update_teacher
  teacher = Teacher.new
  puts "Enter ID to Edit"
  teacher = Teacher.find(gets.chomp.to_i)
  if teacher == nil
    puts "User Not found"
  else
    teacher.save
  end
end

def display_teacher
  puts "List of Teachers"
  Teacher.all.each do |teacher|
    if teacher.deleted_at == nil
      puts teacher.display
    end
  end
end

menu = false
while true
  puts "Choose a number"
  puts "[1] Student management"
  puts "[2] Course management"
  puts "[3] Subject management"
  puts "[4] Teacher management"
  puts "[5] Exit"
  choice = gets.chomp.to_i
  if choice == 1
    menu = true
    while menu
      puts "Choose a number"
      puts "[1] Adds new student"
      puts "[2] Deletes student"
      puts "[3] Display students"
      puts "[4] Update student"
      puts "[5] Back to school management"
      choice_2 = gets.chomp.to_i
      case choice_2
      when 1
        new_student
      when 2
        delete_student
      when 3
        display_student
      when 4
        update_student
      when 5
        menu = false
      else
        puts "Invalid choice"
      end
    end
  elsif choice == 2
    menu = true
    while menu
      puts "Choose a number"
      puts "[1] Adds new course"
      puts "[2] Deletes course"
      puts "[3] Display courses"
      puts "[4] Update course"
      puts "[5] Back to school management"
      choice_3 = gets.chomp.to_i
      case choice_3
      when 1
        new_course
      when 2
        delete_course
      when 3
        display_course
      when 4
        update_course
      when 5
        menu = false
      else
        puts "Invalid choice"
      end
    end
  elsif choice == 3
    menu = true
    while menu
      puts "Choose a number"
      puts "[1] Adds new subject"
      puts "[2] Deletes subject"
      puts "[3] Display subjects"
      puts "[4] Update subject"
      puts "[5] Back to school management"
      choice_2 = gets.chomp.to_i
      case choice_2
      when 1
        new_subject
      when 2
        delete_subject
      when 3
        display_subject
      when 4
        update_subject
      when 5
        menu = false
      else
        puts "Invalid choice"
      end
    end
  elsif choice == 4
    menu = true
    while menu
      puts "Choose a number"
      puts "[1] Adds new teacher"
      puts "[2] Deletes teacher"
      puts "[3] Display teachers"
      puts "[4] Update teacher"
      puts "[5] Back to school management"
      choice_2 = gets.chomp.to_i
      case choice_2
      when 1
        new_teacher
      when 2
        delete_teacher
      when 3
        display_teacher
      when 4
        update_teacher
      when 5
        menu = false
      else
        puts "Invalid choice"
      end
    end
  elsif choice == 5
    exit
  else
    puts "Invalid choice"
  end
end


