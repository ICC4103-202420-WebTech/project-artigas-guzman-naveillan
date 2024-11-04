class CoursesController < ApplicationController

  #before_action :authenticate_user!
  #before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]  
  #en caso de no funcionar cancancan

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_course, only: [:show, :edit]
  authorize_resource

  

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find params['id']
  end

  def new
    @course = Course.new 
  end

  def create
    course = current_user.courses.new(course_params)
    if course.save
      redirect_to course
    else
      redirect_to new_course_path
    end
  end

  def edit
    @course = Course.find params['id']
  end

  def update
    course = Course.find params['id']
    if course.update course_params
      redirect_to course_path
    else
      redirect_to edit_courses_path(course), alert: "libro no se pudo actualizar"
    end
  end

  def destroy
    course = Course.find params['id']
    course.destroy
    redirect_to courses_path
  end

  private 
  def course_params
    permitted_params = params.require(:course).permit(:title, :description)
  
  end
  def set_course
    @course = Course.find params['id']
  end
end
  