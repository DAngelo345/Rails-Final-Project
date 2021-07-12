class User < ApplicationRecord

    has_many :shoes
    has_many :favorites
    has_many :favorites, through: :shoes

    
end
