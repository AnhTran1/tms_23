class Subject < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true
  has_many :course_subjects
  has_many :tasks,  dependent: :destroy
  accepts_nested_attributes_for :tasks, allow_destroy: true
end
