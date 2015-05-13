class User < ActiveRecord::Base
  validates :login, :email, presence: true
end
