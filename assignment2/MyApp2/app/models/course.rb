class Course < ApplicationRecord
    belongs_to :teacher, class_name: 'User'
    has_many :lessons, dependent: :destroy
    has_many :enrollments
    has_many :students, through: :enrollments, source: :user
end
  