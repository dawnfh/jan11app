class User < ActiveRecord::Base

   # validates :fname, :lname, :password, presence: true 
   # validates :email, uniqueness: true
   has_many :posts
   has_many :comments

end



