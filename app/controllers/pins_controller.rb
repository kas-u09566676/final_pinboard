class PinsController < ApplicationController
	before_action :find_pin, only:[:show, :edit, :update, :destroy]

	def index
		@pins = Pin.all.order("created_at DESC")
	end

	def show
	end

	def new
		@Pin = Pin.new 
	end

	def create 
		@Pin = Pin.new(pin_params)
	
		if @Pin.save
			redirect_to @Pin, notice: "success is yours well done"
		else
			render 'new'
		end
	end

		def edit
	end

	def update
		if @Pin.update(pin_params)
			redirect_to @Pin, notice: "successfully updated!"
		else
			render'edit'
		end
	end

	def destroy
		@Pin.destroy
		redirect_to root_path
	end

	private

	def pin_params
		params.require(:pin).permit(:title, :description)
	end

	def find_pin
		@Pin = Pin.find(params[:id])
	end
end

