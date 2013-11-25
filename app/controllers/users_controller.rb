class UsersController < ApplicationController
  def show
    response = TokenManager.new(params).perform
    render json: response
  end
  
  def create
    response = Users::Factory.new(params).perform
    render json: response
  end
end