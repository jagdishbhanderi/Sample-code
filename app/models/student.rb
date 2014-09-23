class Student < ActiveRecord::Base

  validates :name, :presence => true

  has_many :classrooms
  has_many :assignments, :through => :classrooms
  has_many :submissions

end
