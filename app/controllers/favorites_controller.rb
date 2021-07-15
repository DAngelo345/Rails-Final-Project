class FavoritesController < ApplicationController
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
        @favorite = current_user.favorites.build(favorite_params)
        
        if @favorite.save
            redirect_to @favorite
        else
            render :new
        end
    end
    def edit
        @favorite = Favorite.find(params[:id])
    end

    def update
        @favorite = Favorite.find(params[:id])
        @favorite.update(favorite_params)
        redirect_to favorite_path(@shoe)
    end

    def destroy
        Favorite.find(params[:id]).destroy
        redirect_to user_path
    end

    private

    def favorite_params
        params.require(:favorite).permit(:favorite_count)
    end
end
