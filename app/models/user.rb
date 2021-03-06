class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, presence: true
    # validates :password, length: { in: 5..20 }

    has_many :shoes
    has_many :favorites
    has_many :favorited_shoes, through: :favorites, source: :shoe
    # has_many :shoes, through: :favorites

    def self.find_or_create_by_google(user_info)
        self.find_or_create_by(email: user_info[:email]) do |user|
            user.username = user_info[:name]
            user.password = SecureRandom.hex
        end
    end
end
