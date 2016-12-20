class EventsController < ApplicationController
  def index
    @events_local = Event.where(state:current_user.state)
    @events_foreign = Event.where.not(state:current_user.state)
    render 'index'
  end
  def create
  	@event = Event.new(event_params)
    @event.host = current_user.full_name
    # puts 'User id below'
    # puts current_user.id
    # puts 'User current_user below'
    # puts current_user.inspect
    # puts 'Event is below'
    # puts @event.inspect
    @event.user = current_user
    # puts 'Event2 is below'
    # puts @event.inspect
    if @event.valid?
      @event.save
      redirect_to "/events"
    else
      # puts @event.name
      # puts @event.date
      # puts @event.host
      # puts @event.location
      # puts @event.state
      puts @event.errors.messages
      flash[:errors] = @event.errors.full_messages
      redirect_to 'events#index'
    end
  end

  def delete
  end

  def show
    @event = Event.find(params[:id])
    @joins = Join.all.where(event_id:params[:id])

    render 'show'
  end

  def edit
  end

  def event_params
    params.require(:event).permit(:name, :date, :location, :state, :host)
  end
end
