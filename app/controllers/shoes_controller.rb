class ShoesController < ApplicationController
    before_action :redirect_if_not_logged_in

    # <%= link_to "nike branded shoes", brand_path

    def index
        # @shoes = Shoe.all
            @shoes = Shoe.name_of_shoe(params[:search])
        # end
        # binding.pry
    end

    def search
        # @shoes = Shoe.where("name LIKE ?", "%#{params[:search]}%")
        # binding.pry
    end

    def brand
        # @shoes = Shoe.find(params[:brand])
         @shoes = Shoe.where(brand: "NIKE ")
        #  binding.pry
    end

    def new
        @shoe = Shoe.new 
    end

    def show
        @favorite = Favorite.new
        @shoe = Shoe.find(params[:id])
        # binding.pry
    end

    def create
        @shoe = current_user.shoes.build(shoe_params)
        
        if @shoe.save
            redirect_to @shoe
        else
            redirect_to users_path
        end
    end

    def edit
        @shoe = Shoe.find(params[:id])
    end

    def update
        @shoe = Shoe.find(params[:id])
        @shoe.update(shoe_params)
        redirect_to shoe_path(@shoe)
    end

    def destroy
        Shoe.find(params[:id]).destroy
        redirect_to users_path
    end

    private

    def shoe_params
        params.require(:shoe).permit(:brand, :name, :image, :description)
    end
end
