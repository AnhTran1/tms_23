class UserSubject < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  belongs_to :trainee_course
  belongs_to :course_subject
  has_many :user_tasks, dependent: :destroy
  accepts_nested_attributes_for :user_tasks, allow_destroy: true

  def finish?
    finish
  end

  def started?
    !start_at.nil?
  end
end
