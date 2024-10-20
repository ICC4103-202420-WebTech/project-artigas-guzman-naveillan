class Question < ApplicationRecord
    belongs_to :user
    belongs_to :lesson
    has_many :answers, dependent: :destroy
    validates :content, :user_id, :lesson_id, presence: true
  end