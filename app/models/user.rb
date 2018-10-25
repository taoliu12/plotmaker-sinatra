class User < ActiveRecord::Base
    has_many :plots
    has_secure_password
    validates :username, presence: :true, uniqueness: true
    validates :email, presence: :true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
