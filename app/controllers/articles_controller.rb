class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:index, :show, :like]
    before_action :article_same_user, only: [:edit, :update, :destroy]
    before_action :require_user_like, only: [:like]
    
    def index
      @articles = Article.all
      @articles = Article.paginate(page: params[:page], per_page: 5)
    end
    
    def show
      @comment = Comment.new
      @comments = Comment.all
      
    end
    
    def new
      @article= Article.new
    end
    
    def create
      @article = Article.new(article_params)
      @article.user = current_user
      if @article.save
        flash[:success] = "artigo criado com sucesso"
        redirect_to article_path(@article)
      else
        render 'new'
      end
    end
    
    def edit
      
    end
    
    def update
      if @article.update(article_params)
        flash[:success] = "artigo atualizado"
        redirect_to article_path(@article)
      else
        render 'edit'
      end
    end
    
    def destroy
      Article.find(params[:id]).destroy
      flash[:success] = "artigo foi deletado"
      redirect_to article_path
    end
    
    private
    
      def set_article
        @article = Article.find(params[:id])
      end
    
      def article_params
        params.require(:article).permit(:name, :description, topics_ids: [])
      end
      
      def article_same_user
        if current_user != @article.user
          flash[:danger] = "voce so pode atualizar ou deletar seus artigos"
          redirect_to articles_path
        end  
      end
  end
