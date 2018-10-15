class User < ActiveRecord::Base
    has_many :plots
    has_secure_password #password_digest 
    validates :username, presence: :true
    validates :email, presence: :true
end
