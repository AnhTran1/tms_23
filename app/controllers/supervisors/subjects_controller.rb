class Supervisors::SubjectsController < ApplicationController
  before_action :logged_in_user
  before_action :supervisor_user
	
  def index
	@subjects = Subject.order(:name)
  end

  def show
	@subject = Subject.find params[:id]
	@tasks = @subject.tasks	
  end

  def new
	@subject = Subject.new
    @task = @subject.tasks.build
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = "Subject created!"
      redirect_to supervisors_subjects_url
    else
      render 'new'
    end
  end

  def edit
	@subject = Subject.find params[:id]
  end

  def update
	@subject = Subject.find params[:id]
    if @subject.update_attributes subject_params
      flash[:success] = "Subject updated!"
      redirect_to supervisors_subjects_url
    else
      render 'edit'
    end
  end

  def destroy
    @subject = Subject.find params[:id]
    @subject.destroy
    flash[:success] = "Subject deleted"
    redirect_to supervisors_subjects_url  
  end

  private
	def subject_params
      params.require(:subject).permit(:name, :description, 
        tasks_attributes:[:id, :content])
    end
end