class  User < ApplicationRecord

    
    has_many :guests,  through: :houses
    has_many :houses
    has_secure_password
    
end