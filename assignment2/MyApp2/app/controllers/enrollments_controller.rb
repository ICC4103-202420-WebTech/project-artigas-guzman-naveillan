class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @enrollments = current_user.enrollments
    @courses = current_user.courses
  end 

  def create
    @course = Course.find(params[:course_id])
    @enrollment = Enrollment.new(user: current_user, course: @course)

    if @enrollment.save
      redirect_to @course, notice: 'Course added.'
    else
      redirect_to @course, alert: 'You are already part of this course.'
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @enrollment = Enrollment.find_by(user: current_user, course: @course)

    if @enrollment.destroy
      redirect_to enrollments_path, notice: 'Course deleted.'
    else
      redirect_to @course, alert: 'Error.'
    end
  end
end
