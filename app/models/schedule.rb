class Schedule < ActiveRecord::Base
  has_many :courses
  belongs_to :user
end
