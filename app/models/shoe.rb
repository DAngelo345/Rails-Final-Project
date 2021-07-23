class Shoe < ApplicationRecord
    validates :brand, presence: true
    validates :name, presence: true
    validates :description, presence: true
    validates :description, length: { maximum: 500 }

    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :users, through: :favorites
    scope :name_of_shoe, -> (name_of_shoe){ where("name LIKE ?", "%#{name_of_shoe}%" )}
    # scope  :self.where("name LIKE ?", "%#{params[:search]}%")
    # def self.name_of_shoe(name_of_shoe)
    #     where("name_of_shoe LIKE ?", "%#{name_of_shoe}%" )
    # end
    def self.first_five
        all.limit(5)
    end

    def find_shoes_rated_10
        # this is useful sorting filtering out pages say someone 
        # only wants to see shoes that are in their size 
        fav = Favorite.where(rating: 10).all
    end

    def delete_shoe
        Shoe.find_by_brand("yeezy").destroy
    end

    
end
