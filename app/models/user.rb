class User < ApplicationRecord

validates :email, presence: true, uniqueness: {case_sensitive:false} #user name is not  case_sensitive
has_secure_password  #method to load the brycpt gem

has_many :events
  #has_many :orders

end
