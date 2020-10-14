class GreenhousesController < ApplicationController
  before_action :authenticate_user!

  def index
    @title = 'Estufas'
    @greenhouses = Greenhouse.where(user: current_user)
  end
end
