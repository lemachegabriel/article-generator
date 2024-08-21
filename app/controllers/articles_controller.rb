class ArticlesController < ApplicationController
  def show 
    @article = Article.find_by(param: params[:param])
    if @article
      render :show
    end
  end
end