class  House < ApplicationRecord
    has_many :guests
    has_many :users, through: :guests
    accepts_nested_attributes_for :guests

    validates :adress, uniqueness: true
end