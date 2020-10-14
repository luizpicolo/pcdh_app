class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @title = 'Página inicial'
  end
end
