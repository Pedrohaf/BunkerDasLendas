class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    before_action :require_admin, only: [:destroy]
  
    def index
      @users = User.all
      
    end
    

    def new
        @user = User.new
    end
    def create 
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Bem Nindo #{@user.username} ao Blog das lendas"
        redirect_to user_path(@user)
      else
        render 'new'
      end    
    end

    def show 
      @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
      
    end

    def edit
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success] = "Conta atualizada com sucesso"
        redirect_to @user
      else
        render 'edit'
      end  
    end

    def destroy
      if !@user.admin?
        @user.destroy 
        flash[:danger] = "todos os artigos desse usuario seram apagados"
        redirect_to users_path
      end
    end
    
    private 
      def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
      end


      def require_same_user
        if current_user != @user and !current_user.admin?
          flash[:danger] = "voce so pode editar e excluir artigos do seu perfil"
          redirect_to articles_path
        end  
      end

      def set_user
        @user = User.find(params[:id])
      end
  
      def require_admin
        if logged_in? & !current_user.admin?
        flash[:danger] = "Apenas o administrador pode fazer isto"
        redirect_to root_path
      end
    end    
      
end