class Subject < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true
  has_many :course_subjects
end
