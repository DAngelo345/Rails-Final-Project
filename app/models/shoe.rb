class Shoe < ApplicationRecord
    validates :brand, presence: true
    validates :name, presence: true
    validates :description, presence: true
    validates :description, length: { maximum: 500 }


    belongs_to :user
    has_many :favorites
    has_many :users, through: :favorites
end
