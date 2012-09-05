class User < ActiveRecord::Base
 attr_accessible :description, :email, :name, :phone, :password, :password_confirmation
 has_secure_password
  
 validates :password, presence: true, length: { minimum: 6 }
 validates :password_confirmation, presence: true
  
end
