class  User < ApplicationRecord

    
    has_many :guests  
    has_many :houses,   through: :guests
    has_secure_password
    
    
    #  validates :name, uniqueness: true
    #  validates :name, presence: true
    #  validates :email, presence: true
    #  validates :email, uniqueness: true
    #  validates :password_digest, uniqueness: true
    #  validates :password_digest, presence: true



def self.find_or_create_by_omniauth(auth_hash)
    self.where(:email=> auth_hash["info"]["GitHub"]).first_or_create do |user|
        # raise.error
        user.name = ( auth_hash["info"]["nickname"])
    user.password = SecureRandom.hex
    end
 end
end
     

    #  def self.sign_in_from_omniauth(auth)
    #     find_by(provider: auth['provider'],) uid: auth['uid']) || create_user_from_omniauth(auth)
    # end
    
    
    
    # def self.create_user_from_omniauth(auth)
    #     create(
    #         provider: auth['provider'],
    #         uid: auth['uid'],
    #         name: auth['info']['name']
    
    #     )
    #  end 
