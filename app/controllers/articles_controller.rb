class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    def show
        @article = Article.find(params[:id])
    end
    def new
        @article = Article.new
    end
    def create
        @article = Article.new(article_params)
        @article.user = User.first
        if @article.save
          flash[:success] = "Artigo criado com sucesso!"
          redirect_to article_path(@article)
        else
          render 'new'
        end
    end
    def edit
       @article = Article.find(params[:id])
    end
    def update
        if @article.update(article_params)
          flash[:success] = "Artigo atualizado com sucesso!"
          redirect_to article_path(@article)
        else
          render 'edit'
        end
    end
      
    private
      
     def article_params
        params.require(:article).permit(:name, :description)
     end 
    
end     
