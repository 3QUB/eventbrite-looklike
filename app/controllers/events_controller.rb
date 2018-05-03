class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.creator_id = current_user.id
    if @event.save
      flash[:success] = "Event créé!"
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    permitted_columns = params.require(:event).permit(:name, :location, :description, :date_event)
    @event.update_attributes(permitted_columns)

    redirect_to event_path(@event)
  end

  def destroy 
    @event = Event.find(params[:id])
    @event.destroy
  
    redirect_to user_path(@event.creator_id), notice: "Delete success"
  end

  def index
    @event = Event.all
  end

  def subscribe
    @event = Event.find(params[:id])
    @event.attendees << current_user
    redirect_to event_path(@event)
  end
  

  private

  def event_params
    params.require(:event).permit(:location, :description, :date_event, :name)
  end
  
end
