class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course
  before_action :set_lesson, only: %i[create destroy]
  before_action :set_question, only: %i[destroy]


  def create
    @question = @lesson.questions.new(question_params)
    @question.user = current_user

    if @question.save
      redirect_to course_lesson_path(@course, @lesson)
    else
      redirect_to course_lesson_path(@course, @lesson), alert: "error"    
    end
  end

  def destroy
    @question.destroy

    redirect_to course_lesson_path(@course, @lesson)
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def set_question
    @question = @lesson.questions.find(params[:id])
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  def question_params
    params.require(:question).permit(:content)
  end


end