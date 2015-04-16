class User < ActiveRecord::Base
    has_many :schedules
    validates :first_name, :last_name, :email, presence: { message: "This field is required" }
    validates :email, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, message: "Enter a valid e-mail address"}
end
