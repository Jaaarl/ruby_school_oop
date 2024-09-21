# frozen_string_literal: true
class Course
  attr_accessor :id, :name, :deleted_at
  @@records = []

  def save
    if id > 0 && id < self.class.all.size + 1
      existing_course = self.class.all.find { |course| course.id == id }
      puts "Enter name"  
      existing_course.name = gets.chomp
      puts self.display
      puts "Course updated successfully!"
    else
      @@records.prepend(self)   
    end
  end

  def destroy
    self.deleted_at = Time.now
  end

  def display
    puts "ID: #{self.id}, Name: #{self.name}"
  end

  def self.all
    return @@records
  end

  def self.find(id)
    return @@records.find { |course| course.id == id }
  end
end
