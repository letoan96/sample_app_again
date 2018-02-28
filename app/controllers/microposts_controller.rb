class MicropostsController < ApplicationController
	def create
		@micropost = Micropost.new(micropost_params)
		@user = current_user
		@micropost.user_id = @user.id
		respond_to do |format|
			if @micropost.save
				format.html { redirect_to @user, notice: "Post was successfully created!"}
				format.js
			else
				format.html { render :new }
				format.js	
			end
		end
	end

	def destroy
		@micropost = Micropost.find_by(:id => params[:id])
		if @micropost.destroy
			respond_to do |format|
				format.html
				format.js
			end
		end
	end

	def edit 
  		@micropost = Micropost.find_by(:id => params[:id])
  		respond_to do |format|
  			format.html
				format.js
			end
	end

	def update
		@micropost = Micropost.find_by(:id => params[:id])
		@micropost.user_id = current_user.id
		
			respond_to do |format|
				if @micropost.update_attributes(micropost_params)
					format.js
				else
					format.html { render :new }
					format.js	
				end
			end
	end

	private
	def micropost_params
		params.require(:micropost).permit(:user_id, :content)
	end
end
