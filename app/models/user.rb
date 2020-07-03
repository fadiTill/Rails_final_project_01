class  User < ApplicationRecord

    
    has_many :guests  
    has_many :houses,   through: :guests
    has_secure_password
    

    # validates :name, uniqueness: true, message: "Name already exist"
    # validates :email, uniqueness: true, message: "Email already exist"
    # validates :password_digest, uniqueness: true, message: "Password  already exist"
end