class  Guest < ApplicationRecord
    
     belongs_to :user
     belongs_to :house


     
     validates :name, presence: true
     validates :email, presence: true, uniqueness: true
     validates :phone_number, presence: true, uniqueness: true
end