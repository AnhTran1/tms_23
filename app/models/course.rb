class Course < ActiveRecord::Base
  has_many :supervisor_courses, dependent: :destroy
  has_many :trainee_courses, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true
end
