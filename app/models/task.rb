class Task < ActiveRecord::Base
  belongs_to :subject
  validates :content, presence: true
end
