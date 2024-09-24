# frozen_string_literal: true
require_relative 'course'
require_relative 'subject'
require_relative 'person'
class Student < Person
  attr_accessor :course_id
  @@records = []

  def save
    if id > 0 && id < self.class.all.size + 1
      existing_student = self.class.all.find { |student| student.id == id }
      puts "Enter name"  
      existing_student.name = gets.chomp
      puts "Enter birth date"
      existing_student.birth_date = gets.chomp
      puts "Enter email"
      existing_student.email = gets.chomp
      puts "Enter phone number"
      existing_student.phone_number = gets.chomp.to_i
      puts "List of courses"
      Course.all.each do |course|
        if course.deleted_at == nil
          puts course.display
        end
      end
      puts "Enter Course ID"
      existing_student.course_id = gets.chomp.to_i
      puts self.display
      puts "Student Updated successfully!"
    else
      @@records.prepend(self)   
    end
  end
  
  def destroy
    self.deleted_at = Time.now
  end

  def display
    puts "ID: #{self.id}, Name: #{self.name}, birth_date: #{self.birth_date}, Email: #{self.email}, Phone Number: #{self.phone_number}, Course ID: #{self.course_id}"
  end

  def self.all
    return @@records
  end

  def self.find(id)
    return @@records.find { |student| student.id == id }
  end

  def self.find_by_email(email)
    return @@records.find { |student| student.email == email }
  end

  def subjects
    Subject.all
  end
end
