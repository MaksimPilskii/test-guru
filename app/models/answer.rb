# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :count_answers_on_the_question, on: :create

  scope :correct, -> { where(correct: true) }

  private 
  
  def count_answers_on_the_question
    errors.add(:answers, 'The number of responses should be from 1 to 4') if question.answers.count >= 4
  end
end
