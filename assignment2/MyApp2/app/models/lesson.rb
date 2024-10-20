class Lesson < ApplicationRecord
    belongs_to :course
    has_many :questions, dependent: :destroy
    validates :title, :content, :lesson_type, :course_id, presence: true
  end