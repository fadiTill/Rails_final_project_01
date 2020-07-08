class  User < ApplicationRecord

    
    has_many :guests  
    has_many :houses,   through: :guests
    has_secure_password
    

     validates :name, uniqueness: true
     validates :email, uniqueness: true
     validates :password_digest, uniqueness: true
end