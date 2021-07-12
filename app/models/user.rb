class User < ApplicationRecord
    has_secure_password

    has_many :shoes
    has_many :favorites
    has_many :favorites, through: :shoes

    
end
