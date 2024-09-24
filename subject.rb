# frozen_string_literal: true
class Subject
  attr_accessor :id, :name, :deleted_at
  @@records = []

  def save
    if id > 0 && id < self.class.all.size + 1
      existing_subject = self.class.all.find { |subject| subject.id == id }
      puts "Enter name"
      existing_subject.name = gets.chomp
      puts self.display
      puts "Subject updated successfully!"
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
    return @@records.find { |subject| subject.id == id }
  end
end
