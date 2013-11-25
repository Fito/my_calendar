class EventsController < ApplicationController
  def index
    response = Events::Manager.new(params).perform
    render json: response
  end
  
  def create
    puts params.inspect
    response = Events::Creator.new(params).perform
    render json: response
  end
end