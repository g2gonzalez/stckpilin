class User < ActiveRecord::Base
  has_secure_password
  belongs_to :location
  has_many :stocks
end
