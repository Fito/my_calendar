 class EventsController < ApplicationController
  def index
    response = Events::Manager.new(params).perform
    render json: response
  end
  
  def create
    response = Events::Creator.new(params).perform
    render json: response
  end
end