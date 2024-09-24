# frozen_string_literal: true
class Person
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :deleted_at
  @@records = []
end
