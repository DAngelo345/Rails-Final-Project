class ShoesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @shoes = Shoe.all
        # binding.pry
       
    end

    def new
        @shoe = Shoe.new 
    end

    def show
        @shoe = Shoe.find(params[:id])
    end

    def create
        @shoe = current_user.shoes.build(shoe_params)
        
        if @shoe.save
            redirect_to @shoe
        else
            render :new
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
    end

    private

    def shoe_params
        params.require(:shoe).permit(:brand, :name, :image, :description)
    end
end
