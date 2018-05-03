class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.creator_id = current_user.id
    if @event.save
      flash[:success] = "Event créé!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def index
  end

  private

  def event_params
    params.require(:event).permit(:location, :description, :date_event)
  end
  
end
