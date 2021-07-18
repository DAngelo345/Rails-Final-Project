class Shoe < ApplicationRecord
    validates :brand, presence: true
    validates :name, presence: true
    validates :description, presence: true
    validates :description, length: { maximum: 500 }


    belongs_to :user
    has_many :favorites
    has_many :users, through: :favorites
    # scope :name_of_shoe, -> (name_of_shoe){ where("name_of_shoe LIKE ?", "%#{name_of_shoe}%" )}

    # def self.name_of_shoe(name_of_shoe)
    #     where("name_of_shoe LIKE ?", "%#{name_of_shoe}%" )
    # end
    def self.first_five
        all.limit(5)
    end

    
end
