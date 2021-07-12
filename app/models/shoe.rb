class Shoe < ApplicationRecord
    validates :brand, presence: true
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :description, presence: true
    validates :description, length: { maximum: 500 }


    belongs_to :user
    has_many :favorites
    has_many :favorites, through: :users
end
