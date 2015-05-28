class TraineeCourse < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :user_subjects, dependent: :destroy

  def started?
    !start_at.nil?
  end
  def finish?
    finish == 1
  end
end
