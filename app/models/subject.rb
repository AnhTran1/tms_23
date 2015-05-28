class Subject < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true
  has_many :course_subjects,  dependent: :destroy
  has_many :tasks,  dependent: :destroy
  has_many :user_subjects ,dependent: :destroy
  # has_many :trainee_subjects, dependent: :destroy
  accepts_nested_attributes_for :tasks, :reject_if => :all_blank, allow_destroy: true
end
