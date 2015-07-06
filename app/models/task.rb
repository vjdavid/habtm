class Task < ActiveRecord::Base
  has_many :assignments
  has_many :people, through: :assignments
end
