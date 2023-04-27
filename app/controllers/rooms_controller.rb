class RoomsController < ApplicationController
  before_filter :require_authentication,
    :only => [:new, :edit, :create, :update, :destroy]

  # GET /rooms or /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1 or /rooms/1.json
  def show
    @room = Room.find(params[:id])
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
    @room = Room.find(params[:id])
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(params[:room])

    if @room.save
      redirect_to @room, :notice => t('flash.notice.room_created')
    else
      render action: "new"
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    @room = Room.find(params[:id])

    if @room.update_attributes(params[:room])
      redirect_to @room, :notice => t('flash.notice.room_updated')
    else
      render :action => "edit"
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    
    redirect_to rooms_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:title, :location, :description)
    end
end
