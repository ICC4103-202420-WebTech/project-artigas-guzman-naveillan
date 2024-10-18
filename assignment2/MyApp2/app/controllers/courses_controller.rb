class CoursesController < ApplicationController
    
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
    course = Course.new course_params
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
    permitted_params = params.require(:course).permit(:title, :description, :teacher_id)
    permitted_params[:teacher_id] = default_teacher_id if permitted_params[:teacher_id].nil?
    permitted_params
  end

  def default_teacher_id
   1
  end
end
  