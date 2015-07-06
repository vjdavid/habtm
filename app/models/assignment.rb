class Assignment < ActiveRecord::Base
  belongs_to :person
  belongs_to :task

  enum status: {
    :ACTIVE => 1,
    :INACTIVE => 0,
  }

end
