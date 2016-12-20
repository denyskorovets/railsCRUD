class JoinsController < ApplicationController
  def join
  	join = Join.new(user_id: current_user.id, event_id:params[:id])
  	if join.save
  		redirect_to 'events/'
  	else
  	  flash[:errors] = join.errors.full_messages
      redirect_to 'events/'
    end
  end

  def cancel
  end
end
