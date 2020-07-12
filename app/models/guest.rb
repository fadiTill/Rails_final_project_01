class  Guest < ApplicationRecord
    
     belongs_to :user
     belongs_to :house


     
     validates :name, presence: true
     validates :email, presence: true
     validates :email, uniqueness: true
     validates :phone_number, presence: true
     validates :phone_number, uniqueness: true
end