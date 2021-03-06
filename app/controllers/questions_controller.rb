# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy]
  before_action :find_test, only: %i[new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: '<p> Вопросы от всех тестов: <%=Question.all.map(&:body).join("<br>").html_safe %> </p>'
  end

  def show
    render inline: '<p> Вопрос: <%= @question.body %>'
  end

  def new; end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def destroy
    @question.destroy

    render plain: 'Вопрос был удален'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
