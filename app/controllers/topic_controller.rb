class TopicController < ApplicationController
    before_action :set_topic, only: [:edit, :update, :show]
    before_action :require_admin, except: [:show, :index]

    def new
        
    end

    def create
        
    end

    def edi 
        
    end

    def update 
        
    end
    
    def show 
        @ingredient_recipes = @ingredient.recipes.paginate(page: params[:page], per_page: 5)
    end

    def index
        @topic = Topic.paginate(page: params[:page], per_page: 5)
    end
    
    private
  
        def set_topic
            @topic = Topic.find(params[:id])
        end
        def require_admin
            if !logged_in? || (logged_in? and !current_user.admin?)
              flash[:danger] = "Somente admin pode realizar estar ação"
              redirect_to topic_path
            end
        end
    
    
end