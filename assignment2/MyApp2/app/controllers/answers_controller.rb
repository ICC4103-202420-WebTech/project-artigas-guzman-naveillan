class AnswersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_question
    before_action :set_answer, only: [:destroy]
  
    def create
      @answer = @question.answers.new(answer_params)
      @answer.user = current_user
  
      if @answer.save
        redirect_to course_lesson_path(@question.lesson.course, @question.lesson), notice: 'Respuesta creada con éxito.'
      else
        redirect_to course_lesson_path(@question.lesson.course, @question.lesson), alert: 'Error al crear la respuesta.'
      end
    end
  
    def destroy
      @answer.destroy
      redirect_to course_lesson_path(@question.lesson.course, @question.lesson), notice: 'Respuesta eliminada con éxito.'
    end
  
    private
  
    def set_question
      @question = Question.find(params[:question_id])
      @course = Course.find(params[:course_id])
      @lesson = @course.lessons.find(params[:lesson_id])
      @question = @lesson.questions.find(params[:question_id])
    end
  
    def set_answer
      @answer = @question.answers.find(params[:id])
    end
  
    def answer_params
      params.require(:answer).permit(:content)
    end
  end
  