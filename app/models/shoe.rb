class Shoe < ApplicationRecord
    belongs_to :user
    has_many :favorites
    has_many :favorites, through: :users
end
