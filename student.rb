# frozen_string_literal: true
class Student
  attr_accessor :id, :name, :birth_date, :email, :phone_number
  @@records = []

  def save
    @@records.prepend(self)
  end

  def destroy
    @@records.delete(self)
  end

  def display
    puts "ID: #{self.id}, Name: #{self.name}, birth_date: #{self.birth_date}, Email: #{self.email}, Phone Number: #{self.phone_number}"
  end

  def self.all
    return @@records
  end

  def self.find(id)
    return @@records.find {|student|student == id}
  end

  def self.find_by_email(email)
    return @@records.find {|student|student == email}
  end
end
