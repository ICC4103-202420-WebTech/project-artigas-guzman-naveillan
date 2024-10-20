class Answer < ApplicationRecord
    belongs_to :user
    belongs_to :question

    validates :content, :user_id, :question_id, presence: true
  end
  