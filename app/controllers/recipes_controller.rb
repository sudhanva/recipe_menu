class RecipesController < ApplicationController


	def index
		@recipe = Recipe.all.order("created_at DESC")
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	def new
		@recipe=Recipe.new
	end

	def edit
		@recipe = Recipe.find(params[:id])
	end

	def create
		@recipe=Recipe.new(show_params)
		if @recipe.save
			flash[:notice] = "Successfully Created"
			redirect_to(:action=>'index')
		else
			render "new"
		end
	end

	def update
		@recipe = Recipe.find(params[:id])
		if @recipe.update_attributes(show_params)
			flash[:notice] = "Successfully updated." 
      		redirect_to(:action=>'index')
    	else
    		flash[:notice] = "Record not saved." 
    		render('edit')
    	end
	end

	def destroy
		@recipe = Recipe.find(params[:id])
		@recipe.destroy
		redirect_to root_path, notice: "Successfully deleted recipe"
	end

	private
	def show_params
		params.require(:recipe).permit(:title,:description,:image,:user_id)
	end
end
