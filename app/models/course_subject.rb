class CourseSubject < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject
  def started?
    !start_at.nil?
  end
end
