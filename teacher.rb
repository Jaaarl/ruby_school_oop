# frozen_string_literal: true
class Teacher
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :department, :deleted_at
  @@records = []

  def save
    if id > 0 && id < self.class.all.size + 1
      existing_teacher = self.class.all.find { |teacher| teacher.id == id }
      puts "Enter name"  
      existing_teacher.name = gets.chomp
      puts "Enter birth date"
      existing_teacher.birth_date = gets.chomp
      puts "Enter email"
      existing_teacher.email = gets.chomp
      puts "Enter phone number"
      existing_teacher.phone_number = gets.chomp.to_i
      puts "Enter Department"
      existing_teacher.department = gets.chomp.to_i
      puts self.display
      puts "Teacher Updated successfully!"
    else
      @@records.prepend(self)   
    end
  end

  def destroy
    self.deleted_at = Time.now
  end

  def display
    puts "ID: #{self.id}, Name: #{self.name}, birth_date: #{self.birth_date}, Email: #{self.email}, Phone Number: #{self.phone_number}, Department: #{self.department}"
  end

  def self.all
    return @@records
  end

  def self.find(id)
    return @@records.find { |teacher| teacher.id == id }
  end

  def self.find_by_email(email)
    return @@records.find { |teacher| teacher.email == email }
  end
end
