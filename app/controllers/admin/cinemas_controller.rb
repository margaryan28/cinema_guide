class Admin::CinemasController < Admin::ApplicationController

	before_action :find_cinema, only: [:edit, :update, :destroy]

	def index
		@cinemas = Cinema.all.order('created_at desc')
	end

	def show
		
	end

	def new
		@cinema = Cinema.new
	end

	def create
		@cinema = Cinema.new(cinema_params)
		if @cinema.save
			flash[:notice] = 'Cinema added successfully!'
			redirect_to admin_cinemas_path
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @cinema.update(cinema_params)
			flash[:notice] = 'Cinema\'s details updated successfully!'
			redirect_to admin_cinemas_path
		else
			render 'edit'
		end
	end

	def destroy
		if @cinema.destroy
			flash[:notice] = 'Cinema deleted successfully!'
			redirect_to admin_cinemas_path
		end
	end

	private
	def cinema_params
		params.require(:cinema).permit(:name, :featured, :location, :telephone, :open_hour, :close_hour, :open_day, :close_day, :is_active)
	end

	def find_cinema
		@cinema = Cinema.find(params[:id])
	end
end
