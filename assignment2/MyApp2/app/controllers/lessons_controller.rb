class LessonsController < ApplicationController

  #before_action :authenticate_user!
  #before_action :set_course
  #before_action :authorize_teacher, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_user! , except: [:show]
  before_action :set_course, only: [:show, :edit]

  def show
    @lesson = Lesson.find params['id']
  end

  def new
    @course = Course.find(params[:course_id])
    @lesson = @course.lessons.build
    authorize! :create, @lesson
  end

  def create
    course = Course.find(params[:course_id])
    lesson = course.lessons.build(lesson_params)
    if lesson.save
      redirect_to course_path(course)
    else
      new_course_lesson_path(course)
    end
  end

  def edit
    @lesson = Lesson.find params['id']
    authorize! :update, @lesson 
  end

  def update
    lesson = Lesson.find params['id']
    if lesson.update(lesson_params)
      redirect_to lesson_path(lesson)
    else
      render :edit
    end
  end

  def destroy
    lesson = Lesson.find params['id']
    authorize! :destroy, @lesson
    lesson.destroy
    redirect_to course_path(lesson.course_id)
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :content, :lesson_type, :course_id)
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  def authorize_teacher
    unless current_user == @course.teacher_id
      redirect_to course_path(@course), alert: 'No tienes permisos para realizar esta acción.'
    end
  end

end