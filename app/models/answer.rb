# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validates :question_id, presence: true, unless: :count_answers_on_the_question, on: :create

  scope :correct_answers, lambda { |test_to_find_the_correct_answer|
                            joins(:question).where(questions: { test_id: test_to_find_the_correct_answer }).where(answers: { correct: true })
                          }
  scope :correct_answer, -> { where(correct: true) }

  def count_answers_on_the_question
    errors.add(:answers, 'The number of responses should be from 1 to 4') if question.answers.count >= 4
  end
end
