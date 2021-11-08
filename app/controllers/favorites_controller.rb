class FavoritesController < ApplicationController

    before_action :redirect_if_not_logged_in
    before_action :set_shoe
#<p> <%= link_to "delete", favorite_delete_path, method: "delete" %> </p>
#<li><%=# link_to "Favorites", user_favorites_path(current_user) %></li>
#     <% @favorites.each do |favorite| %>
#         <p> Brand : <%= favorite.shoe.brand %> </p>
#         <p> Name : <%= favorite.shoe.name %> </p>
#         <p> Rating : <%= favorite.rating %> </p>
#         <p> Your comment : <%= favorite.comment %> </p>
#         <p> <%= link_to "Delete", favorite, method: :delete, data: { confirm: "Really?" } %></p>
# <% end %>

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            #nested
            @favorites = @user.favorites
        else
        @favorites = Favorite.all
        end
    end

    def shoes_with_rating_of_10
        @favorites = Favorite.where(rating: 10).all
    render "index"
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
        @favorite = current_user.favorites.build(favorite_params)
        @favorite.shoe = @shoe
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
        redirect_to user_path(current_user)
    end

    private

    def set_shoe
        @shoe = Shoe.find(params[:shoe_id]) if params[:shoe_id]
    end

    def favorite_params
        params.require(:favorite).permit(:shoe_name, :rating, :comment)
    end
end
