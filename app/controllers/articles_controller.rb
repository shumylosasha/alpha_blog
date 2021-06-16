class ArticlesController < ApplicationController
	before_action :articles_params, only: [:show, :edit, :update, :destroy]

	def show
	end

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def edit
	end

	def create
		@article = Article.new(params_desc)
		# render plain: @article.inspect
		if @article.save
			flash[:notice] = "Article was succesfully created"
			redirect_to article_path(@article)
		else
			render "new"
		end
	end

	def update
		if @article.update(params_desc)
			flash[:notice] = "Article successfuly updated"
			redirect_to @article
		else
			render "edit"
		end
	end

	def destroy
		@article.destroy
		redirect_to articles_path
	end

	private

	def articles_params
		@article = Article.find(params[:id])
	end

	def params_desc
		params.require(:article).permit(:title, :description)
	end

end
