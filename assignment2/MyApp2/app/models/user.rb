class User < ApplicationRecord
    has_many :courses, foreign_key: 'teacher_id', dependent: :destroy
    has_many :enrollments
    has_many :enrolled_courses, through: :enrollments, source: :course
    has_many :questions, dependent: :destroy
    has_many :answers, dependent: :destroy
    validates :name, :email, :role, presence: true
  end
  