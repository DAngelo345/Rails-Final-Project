class Favorite < ApplicationRecord

    validates :rating, numericality: {greater_than: 0, less_than_or_equal_to: 10}


    belongs_to :user
    belongs_to :shoe
    

    

    def shoe_name=(name)
        self.shoe = Shoe.find_or_create_by(name: name)
    end
   
    def shoe_name
         self.shoe ? self.shoe.name : nil
    end
end
