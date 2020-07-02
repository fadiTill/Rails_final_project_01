class  User < ApplicationRecord

    
    has_many :guests  
    has_many :houses   through: :guests
    has_secure_password
    
end