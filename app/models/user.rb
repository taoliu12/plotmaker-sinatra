class User < ActiveRecord::Base
    has_many :plots
    has_secure_password
    validates :username, presence: :true, uniqueness: true
    validates :email, presence: :true
end
