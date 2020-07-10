class  House < ApplicationRecord
    has_many :guests, dependent: :destroy 
    has_many :users, through: :guests
    accepts_nested_attributes_for :guests

    validates :adress, uniqueness: true


end