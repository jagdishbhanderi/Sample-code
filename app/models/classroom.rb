class Classroom < ActiveRecord::Base

  validates :name, :presence => true

  belongs_to :student
  has_many :assignments, dependent: :destroy
end
