# frozen_string_literal: true
class StudentSubject
  attr_accessor :id, :student_id, :subject_id
  @@records = []

  def save
    @@records.prepend(self)
  end

  def destroy
    @@records.delete(self)
  end

  def display
    puts "ID: #{self.id}, Student ID: #{self.student_id}, Subject ID: #{self.subject_id}"
  end

  def self.all
    return @@records
  end

  def self.find(id)
    return @@records.find { |record| record.id == id }
  end
end

