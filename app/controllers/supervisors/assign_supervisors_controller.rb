class Supervisors::AssignSupervisorsController < ApplicationController
  before_action :logged_in_user
  before_action :supervisor_user
  before_action :current_course
  # before_action :enrolled_course

  def edit
    @supervisors_enrolls = @course.supervisor_courses
      .paginate(page: params[:page], per_page: 5)
    @supervisors_not_enrolls = User.supervisor_not_enroll_to_courses(@course)
      .paginate(page: params[:page], per_page: 5)
  end

  def create
    user = User.find params[:id]
    @course.supervisor_courses.create user_id: params[:id]
    flash[:success] = "Supervisor #{user.name} has just been added to course"
    redirect_to edit_supervisors_course_assign_supervisors_path(@course)
  end

  def destroy
    user = User.find params[:id]
    @course.trainee_courses.find_by(user_id: user.id).destroy      
    flash[:success] = "Supervisor #{user.name} has just been removed from course"
    redirect_to edit_supervisors_course_assign_supervisors_path @course
  end

  private
	def current_course
		@course = Course.find(params[:course_id])
	end
	def enrolled_course
      unless @course.supervisor_courses.find_by user_id: current_user.id
        flash[:error] = "You can't assign supervisor to this course"
        redirect_to supervisors_course_url @course
      end
    end
end