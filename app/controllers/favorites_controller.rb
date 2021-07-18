class FavoritesController < ApplicationController

    before_action :redirect_if_not_logged_in
    before_action :set_shoe

    def index
        @favorites = Favorite.all
        # binding.pry
       
    end

    def new
        @favorite = Favorite.new 
    end

    def show
        @favorite = Favorite.find(params[:id])
    end

    def create
        # binding.pry
        @favorite = @shoe.favorites.build(favorite_params)
        @favorite.user = current_user
        if @favorite.save
            redirect_to @shoe
        else
            redirect_to users_path
        end
    end

    def edit
        @favorite = Favorite.find(params[:id])
    end

    # def update
    #     @favorite = Favorite.find(params[:id])
    #     @favorite.update(favorite_params)
    #     redirect_to favorite_path(@shoe)
    # end

    def destroy
        Favorite.find(params[:id]).destroy
        redirect_to user_path
    end

    private

    def set_shoe
        @shoe = Shoe.find(params[:shoe_id]) if params[:shoe_id]
    end

    def favorite_params
        params.require(:favorite).permit(:shoe_name, :rating, :comment)
    end
end
