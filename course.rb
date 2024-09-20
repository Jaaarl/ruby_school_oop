# frozen_string_literal: true
class Course
  attr_accessor :id, :name, :deleted_at
  @@records = []

  def save
    @@records.prepend(self)
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
