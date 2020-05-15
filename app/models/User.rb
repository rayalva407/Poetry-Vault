class User < ActiveRecord::Base
  has_many :poems
  has_secure_password
end