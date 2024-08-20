class CooksController < ApplicationController

   
    def index
        @cooks=Cook.all
        @tags = Tag.all
        cook_ids = []
      
        @cook = Cook.where("comment LIKE ? OR ingredient LIKE ? OR recipe LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%") 
      
        if params[:tag_ids]
          @cooks = []
          params[:tag_ids].each do |key, value|      
              @cooks += Tag.find_by(name: key).cooks if value == "1"
          end
          @cooks.uniq!
          @cooks = Kaminari.paginate_array(@cooks).page(params[:page]).per(6)
        end
        @cooks = @cooks.page(params[:page]).per(6)
      end

      
      
       
      

    def new
        @cook = Cook.new
    end
    
    def create
        cook = Cook.new(cook_params)
        if cook.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end
    
    def show
        @cook = Cook.find(params[:id])
    end


    private
    def cook_params
        params.require(:cook).permit(:comment, :ingredient, :recipe, :image, tag_ids: [])
    end
  
    
    end