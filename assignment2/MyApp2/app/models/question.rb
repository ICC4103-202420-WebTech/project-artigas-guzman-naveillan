class Question < ApplicationRecord
    belongs_to :user
    belongs_to :lesson
    has_many :answers, dependent: :destroy
  end