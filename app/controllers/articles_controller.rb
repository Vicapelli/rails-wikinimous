class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]


  def index
    # listar todos os articles
    @articles = Article.all
  end

  def show
    # mostrar detalhes de um article específico
  end

  def new
    # mostrar o formulário para criar um novo artcle
    @article = Article.new

  end

  def create
    # crio um novo article no meu BD com as infos que o usuário inputou
    new_article = Article.new(article_params)

    new_article.save
    redirect_to articles_path
  end

  def edit
  end

  def update
    # atualizo o meu article com as infos que o usuário inputou
    @article.update(article_params)

    redirect_to articles_path
  end

  def destroy
    @article.destroy
    
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    # pegue a hash article dentro de params e só permita os campos
    # title, content (qualquer outro não passará)
    params.require(:article).permit(:title, :content)
  end
end
