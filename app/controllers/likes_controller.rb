class LikesController < ApplicationController
  before_action :require_signin
  before_action :set_event

  def create
  #  @event = Event.find(params[:event_id])
    @event.likes.create!(user: current_user)
    redirect_to @event, notice: "Glad you liked it!"
  end

  def destroy
    like = current_user.likes.find(params[:id])
    like.destroy

  #  @event = Event.find(params[:event_id])
    redirect_to @event, notice: "Sorry!"
  end

private

  def set_event
    @event = Event.find_by!(slug: params[:event_id])
  end
end
