class SearchsController < ApplicationController
  before_action :authenticate_user!

	def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'user'
			@records = User.search_for(@content, @method)
		else
			@records = Book.search_for(@content, @method)
		end
	end
  # def search
  #   @model = params["model"]
  #   @content = params["content"]
  #   @method = params["method"]
  #   @records = search_for(@model, @content, @method)
  # end
  
  # private
  
  # def search_for(model, content, method)
  #   if model == 'user'
  #     if method == 'perfect'
  #       User.where(name: content)
  #     else
  #       User.where('name LIKE ?', '%'+content+'%')
  #     end
  #   elsif model == 'book'
  #     if method == 'perfect'
  #       Book.where(title: content)
  #     else
  #       Book.where('title LIKE ?', '%'+content+'%')
  #     end
  #   end
  # end
end
