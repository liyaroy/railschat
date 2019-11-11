class RoomsController < ApplicationController
	before_action :load_entities

	def index
		@room = Room.all
	end

	def new
		@room = Room.new
	end

	def create
		@room = Room.new permitted_parameters
		if @room.save
			flash[:success] = "#{@room.name} was created successfully"
			redirect_to rooms_path
		else
			render :new
		end
	end

	def edit
	end

	def update
	end

	def show
	  @room_message = RoomMessage.new room: @room
	  @room_messages = @room.room_messages.includes(:user)
	end



  protected

  def load_entities
    @rooms = Room.all
    @room = Room.find(params[:id]) if params[:id]
  end

  def permitted_parameters
    params.require(:room).permit(:name)
  end
end
