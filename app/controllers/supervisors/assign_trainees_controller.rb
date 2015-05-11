class Supervisors::AssignTraineesController < ApplicationController
  before_action :logged_in_user
  before_action :supervisor_user
  before_action :current_course
	
def edit
    @trainee_enrolls = @course.trainee_courses
      .paginate(page: params[:page], per_page: 5)
    @trainee_not_enrolls = User.trainee_not_enroll_to_courses(@course)
      .paginate(page: params[:page], per_page: 5)
  end

  def create
    user = User.find params[:id]
    @course.trainee_courses.create user_id: user.id      
    flash[:success] = "Trainee #{user.name} has just been added to course"
    redirect_to edit_supervisors_course_assign_trainees_path(@course)
  end

  def destroy
    user = User.find params[:id]
    @course.trainee_courses.find_by(user_id: user.id).destroy      
    flash[:success] = "Trainee #{user.name} has just been removed from course"
    redirect_to edit_supervisors_course_assign_trainees_path @course
  end

	private
	def current_course
      @course = Course.find params[:course_id]
    end
end