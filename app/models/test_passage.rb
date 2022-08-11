# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  PERCENTAGE_OF_PASSING_THE_TEST = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def result_test
    (correct_questions / questions.count.to_f * 100).round
  end

  def passed?
    result_test >= PERCENTAGE_OF_PASSING_THE_TEST
  end

  def questions
    @questions ||= test.questions
  end

  def current_question_number
    questions.index(current_question) + 1
  end

  private

  def set_current_question
    self.current_question = next_question
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    return false if answer_ids.nil?
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    self.current_question = if persisted?
                              test.questions.order(:id).where('id > ?',
                                                              current_question.id).first
                            else
                              questions.first
                            end
  end
end
