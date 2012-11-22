class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
		#if user
			sign_in user
			#redirect_to root_url
			redirect_to user
		else
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
#AOA:Bhai Imran,hopefully laptop will be genuin,we can trust him.Battry time around 90 minutes.warranty 7days