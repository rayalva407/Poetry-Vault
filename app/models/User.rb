class User < ActiveRecord::Base
  has_many :poems
end