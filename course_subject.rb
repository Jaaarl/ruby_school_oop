class CourseSubject 
  attr_accessor :id, :course_id, :subject_id
  @@records = []

  def save
    @@records.prepend(self)
  end

  def destroy
    @@records.delete(self)
  end

  def display
    puts "ID: #{self.id}, Course ID: #{self.course_id}, Subject ID: #{self.subject_id}"
  end

  def self.all
    return @@records
  end

  def self.find(id)
    return @@records.find { |record| record.id == id }
  end
end
